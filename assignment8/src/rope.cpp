#include <iostream>
#include <vector>

#include "CGL/vector2D.h"

#include "mass.h"
#include "rope.h"
#include "spring.h"


namespace CGL {

    Rope::Rope(Vector2D start, Vector2D end, int num_nodes, float node_mass, float k, vector<int> pinned_nodes)
    {
        // TODO (Part 1): Create a rope starting at `start`, ending at `end`, and containing `num_nodes` nodes.

//        Comment-in this part when you implement the constructor

        for (int i=0;i<num_nodes; i++)
        {
            Vector2D p = start+(start-end)*i/num_nodes;
            Mass *mass = new Mass(p,node_mass,false);
            masses.push_back(mass);
        }
        for (auto &i : pinned_nodes) {
            masses[i]->pinned = true;
        }

        for(int i = 0; i<num_nodes-1; i++)
        {
            Spring *spring = new Spring(masses[i],masses[i+1],k);
            springs.push_back(spring);
        }
    }

    void Rope::simulateEuler(float delta_t, Vector2D gravity)
    {
        for (auto &s : springs)
        {
            // TODO (Part 2): Use Hooke's law to calculate the force on a node
            Vector2D r = s->m2->position-s->m1->position;
            Vector2D f = s->k*r/r.norm()*(r.norm()-s->rest_length);
            s->m1->forces += f;
            s->m2->forces -= f;
        }

        for (auto &m : masses)
        {
            double kd = 0.0005;
            if (!m->pinned)
            {
                // TODO (Part 2): Add the force due to gravity, then compute the new velocity and position
                m->forces+=gravity;
                m->velocity+=m->forces/m->mass*delta_t;
                m->position+=m->velocity*delta_t;

                // TODO (Part 2): Add global damping
                m->forces-=kd*m->velocity;


            }

            // Reset all forces on each mass
            m->forces = Vector2D(0, 0);
        }
    }

    void Rope::simulateVerlet(float delta_t, Vector2D gravity)
    {
        for (auto &s : springs)
        {
            // TODO (Part 3): Simulate one timestep of the rope using explicit Verlet （solving constraints)
            Vector2D r = s->m2->position-s->m1->position;
            Vector2D f = s->k*r/r.norm()*(r.norm()-s->rest_length);
            s->m1->forces += f;
            s->m2->forces -= f;
        }

        for (auto &m : masses)
        {
            if (!m->pinned)
            {
                Vector2D temp_position = m->position;
                // TODO (Part 3.1): Set the new position of the rope mass
                m->forces+=gravity;
                m->position = temp_position+(temp_position-m->last_position)+m->forces/m->mass*delta_t*delta_t;

                // TODO (Part 4): Add global Verlet damping
                m->position -= 5e-5*(temp_position-m->last_position);
                m->last_position = temp_position;
            }
            m->forces = Vector2D(0, 0);
        }
    }
}
