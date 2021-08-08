#include <algorithm>
#include <cassert>
#include "BVH.hpp"
#include <map>

BVHAccel::BVHAccel(std::vector<Object*> p, int maxPrimsInNode,
                   SplitMethod splitMethod)
    : maxPrimsInNode(std::min(255, maxPrimsInNode)), splitMethod(splitMethod),
      primitives(std::move(p))
{
    time_t start, stop;
    time(&start);
    if (primitives.empty())
        return;

    //root = recursiveBuild(primitives);
    root = SAHrecursiveBuild(primitives);

    time(&stop);
    double diff = difftime(stop, start);
    int hrs = (int)diff / 3600;
    int mins = ((int)diff / 60) - (hrs * 60);
    int secs = (int)diff - (hrs * 3600) - (mins * 60);

    printf(
        "\rBVH Generation complete: \nTime Taken: %i hrs, %i mins, %i secs\n\n",
        hrs, mins, secs);
}

BVHBuildNode* BVHAccel::SAHrecursiveBuild(std::vector<Object*> objects)
{
    BVHBuildNode* node = new BVHBuildNode();

    // Compute bounds of all primitives in BVH node
    Bounds3 bounds;
    for (int i = 0; i < objects.size(); ++i)
        bounds = Union(bounds, objects[i]->getBounds());
    if (objects.size() == 1) {
        // Create leaf _BVHBuildNode_
        node->bounds = objects[0]->getBounds();
        node->object = objects[0];
        node->left = nullptr;
        node->right = nullptr;
        return node;
    }
    else if (objects.size() == 2) {
        node->left = recursiveBuild(std::vector{objects[0]});
        node->right = recursiveBuild(std::vector{objects[1]});

        node->bounds = Union(node->left->bounds, node->right->bounds);
        return node;
    }
    else {
        const int bucketSize = 12;
        Bounds3 centroidBounds;
        for (int i = 0; i < objects.size(); ++i)
            centroidBounds =
                    Union(centroidBounds, objects[i]->getBounds().Centroid());
        int dim = centroidBounds.maxExtent();

        std::vector<Object*> leftObjects;
        std::vector<Object*> rightObjects;

        float nArea = centroidBounds.SurfaceArea();

        int minCostCoor = 0;
        int minCostIndex = 0;
        float minCost = std::numeric_limits<float>::infinity();
        std::map<int, std::map<int,int>> indexMap;// TODO

        for(int i=0;i<3;i++)
        {
            std::vector<Bounds3> boundsBuckets;
            std::vector<int> countBuckets;
            for(int j=0;j<bucketSize;j++)
            {
                boundsBuckets.push_back(Bounds3());
                countBuckets.push_back(0);
            }

            std::map<int,int> objMap;

            for(int j =0;j<objects.size();j++)//把一个新的三角形放进去
            {
                //这里在mac下会有一点编译的小问题
                float p[3];
                p[0]=(centroidBounds.Offset(objects[j]->getBounds().Centroid())).x;
                p[1]=(centroidBounds.Offset(objects[j]->getBounds().Centroid())).y;
                p[2]=(centroidBounds.Offset(objects[j]->getBounds().Centroid())).z;

                int index = bucketSize * p[i];//返回物体所在桶对位置

                if(index > bucketSize-1)
                {
                    index = bucketSize-1;
                }
                Bounds3 b =boundsBuckets[index];
                b = Union(b,objects[j]->getBounds().Centroid());
                boundsBuckets[index] = b;
                countBuckets[index] = countBuckets[index]+1;
                objMap.insert(std::make_pair(j,index));
            }

            indexMap.insert(std::make_pair(i,objMap));

            for(int j=0;j<boundsBuckets.size();j++)
            {
                Bounds3 A;
                Bounds3 B;

                int countA = 0;
                int countB = 0;

                for(int k=0;k<j;k++)
                {
                    A = Union(A,boundsBuckets[k]);
                    countA += countBuckets[k];
                }
                for(int k=j;k<boundsBuckets.size();k++)
                {
                    B = Union(B,boundsBuckets[k]);
                    countB +=countBuckets[k];
                }
                float cost = 1 + (countA*A.SurfaceArea()+countB*B.SurfaceArea())/nArea;

                if(cost < minCost)
                {
                    minCost = cost;
                    minCostCoor = i;
                    minCostIndex = j;
                }
            }
        }

        for(int i = 0; i<objects.size();i++)//object的index和桶的index进行了绑定
        {
            if(indexMap[minCostCoor][i]<minCostIndex)
                leftObjects.push_back(objects[i]);
            else
                rightObjects.push_back(objects[i]);
        }

        assert(objects.size() == (leftObjects.size() + rightObjects.size()));

        node->left = recursiveBuild(leftObjects);
        node->right = recursiveBuild(rightObjects);

        node->bounds = Union(node->left->bounds, node->right->bounds);

    }

    return node;
}


BVHBuildNode* BVHAccel::recursiveBuild(std::vector<Object*> objects)
{
    BVHBuildNode* node = new BVHBuildNode();

    // Compute bounds of all primitives in BVH node
    Bounds3 bounds;
    for (int i = 0; i < objects.size(); ++i)
        bounds = Union(bounds, objects[i]->getBounds());
    if (objects.size() == 1) {
        // Create leaf _BVHBuildNode_
        node->bounds = objects[0]->getBounds();
        node->object = objects[0];
        node->left = nullptr;
        node->right = nullptr;
        return node;
    }
    else if (objects.size() == 2) {
        node->left = recursiveBuild(std::vector{objects[0]});
        node->right = recursiveBuild(std::vector{objects[1]});

        node->bounds = Union(node->left->bounds, node->right->bounds);
        return node;
    }
    else {
        Bounds3 centroidBounds;
        for (int i = 0; i < objects.size(); ++i)
            centroidBounds =
                Union(centroidBounds, objects[i]->getBounds().Centroid());
        int dim = centroidBounds.maxExtent();
        switch (dim) {
        case 0:
            std::sort(objects.begin(), objects.end(), [](auto f1, auto f2) {
                return f1->getBounds().Centroid().x <
                       f2->getBounds().Centroid().x;
            });
            break;
        case 1:
            std::sort(objects.begin(), objects.end(), [](auto f1, auto f2) {
                return f1->getBounds().Centroid().y <
                       f2->getBounds().Centroid().y;
            });
            break;
        case 2:
            std::sort(objects.begin(), objects.end(), [](auto f1, auto f2) {
                return f1->getBounds().Centroid().z <
                       f2->getBounds().Centroid().z;
            });
            break;
        }

        auto beginning = objects.begin();
        auto middling = objects.begin() + (objects.size() / 2);
        auto ending = objects.end();

        auto leftshapes = std::vector<Object*>(beginning, middling);
        auto rightshapes = std::vector<Object*>(middling, ending);

        assert(objects.size() == (leftshapes.size() + rightshapes.size()));

        node->left = recursiveBuild(leftshapes);
        node->right = recursiveBuild(rightshapes);

        node->bounds = Union(node->left->bounds, node->right->bounds);
    }

    return node;
}

Intersection BVHAccel::Intersect(const Ray& ray) const
{
    Intersection isect;
    if (!root)
        return isect;
    isect = BVHAccel::getIntersection(root, ray);
    return isect;
}

Intersection BVHAccel::getIntersection(BVHBuildNode* node, const Ray& ray) const//该函数每次只会返回距离最近对一个包围盒
{
    // TODO Traverse the BVH to find intersection
    Intersection inter;
    Vector3f invDir = ray.direction_inv;
    std::array<int,3>dirIsNeg = {ray.direction.x>0,ray.direction.y>0,ray.direction.z>0};
    if(!node->bounds.IntersectP(ray,invDir,dirIsNeg))
        return inter;
    if(node->left== nullptr&&node->left== nullptr)
        return node->object->getIntersection(ray);

    Intersection left = getIntersection(node->left,ray);
    Intersection right = getIntersection(node->right,ray);

    return left.distance<right.distance?left:right;//先对更先到达对包围盒渲染

    return inter;

}