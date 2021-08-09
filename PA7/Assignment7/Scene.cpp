//
// Created by Göksu Güvendiren on 2019-05-14.
//

#include "Scene.hpp"


void Scene::buildBVH() {
    printf(" - Generating BVH...\n\n");
    this->bvh = new BVHAccel(objects, 1, BVHAccel::SplitMethod::NAIVE);
}

Intersection Scene::intersect(const Ray &ray) const
{
    return this->bvh->Intersect(ray);
}

void Scene::sampleLight(Intersection &pos, float &pdf) const
{
    float emit_area_sum = 0;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        if (objects[k]->hasEmit()){
            emit_area_sum += objects[k]->getArea();
        }
    }
    float p = get_random_float() * emit_area_sum;
    emit_area_sum = 0;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        if (objects[k]->hasEmit()){
            emit_area_sum += objects[k]->getArea();
            if (p <= emit_area_sum){
                objects[k]->Sample(pos, pdf);
                break;
            }
        }
    }
}

bool Scene::trace(
        const Ray &ray,
        const std::vector<Object*> &objects,
        float &tNear, uint32_t &index, Object **hitObject)
{
    *hitObject = nullptr;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        float tNearK = kInfinity;
        uint32_t indexK;
        Vector2f uvK;
        if (objects[k]->intersect(ray, tNearK, indexK) && tNearK < tNear) {
            *hitObject = objects[k];
            tNear = tNearK;
            index = indexK;
        }
    }


    return (*hitObject != nullptr);
}

// Implementation of Path Tracing
Vector3f Scene::castRay(const Ray &ray, int depth) const
{
    Vector3f L_dir={0,0,0};
    Vector3f L_indir={0,0,0};
    // TODO Implement Path Tracing Algorithm here
    Intersection objectInter = intersect(ray);

    if(!objectInter.happened)
        return {};
    if(objectInter.m->hasEmission())//光源
        return objectInter.m->getEmission();


    Intersection lightInter;
    float pdf_light=0.0f;

    sampleLight(lightInter,pdf_light);

    Vector3f p = objectInter.coords;
    Vector3f x = lightInter.coords;
    Vector3f N = objectInter.normal.normalized();
    Vector3f NN = lightInter.normal.normalized();
    Vector3f ws = (x-p).normalized();
    Ray light(p,ws);

    Intersection obj2light = intersect(light);

    if(obj2light.happened && (obj2light.coords - x).norm() < 1e-2)//击中光源
    {
        float r2 = dotProduct(x-p,x-p);
        //直接光
        L_dir = lightInter.emit * objectInter.m->eval(ray.direction,ws,N)* dotProduct(ws,N)* dotProduct(-ws,NN) / r2 / pdf_light;//后面那个为什么是负的？
    }

    if(get_random_float()<RussianRoulette)
    {
        Vector3f wi = objectInter.m->sample(ray.direction,N).normalized();
        Ray r(p,wi);
        Intersection rInter = intersect(r);
        if(rInter.happened&&!rInter.m->hasEmission())
        {
//            std::cout<<castRay(r,depth+1);
//                    std::cout<<castRay(r,depth+1)*objectInter.m->eval(ray.direction,wi,N)* dotProduct(wi,N)<<std::endl;
//            std::cout<<objectInter.m->pdf(ray.direction,wi,N)<<std::endl;
//            std::cout<<RussianRoulette<<std::endl;
            L_indir = castRay(r,depth+1)*objectInter.m->eval(ray.direction,wi,N)* dotProduct(wi,N)/objectInter.m->pdf(ray.direction,wi,N)/RussianRoulette;
        }
    }
    return L_dir+L_indir;
//    shade(p, wo)
//    sampleLight(inter, pdf_light)
//    Get x, ws, NN from inter
//    Shoot a ray from p to x
//    If the ray is not blocked in the middle
//    L_dir = L_i * eval(wo, ws, N) * dot(ws, N) * dot(ws, NN) / |x-p|^2 / pdf_light
//    L_indir = 0.0
//    Test Russian Roulette with probability RussianRoulette wi = sample(wo, N)
//    Trace a ray r(p, wi)
//    If ray r hit a non-emitting object at q
//    L_indir = shade(q, wi) * eval(wo, wi, N) * dot(wi, N) / pdf(wo, wi, N) / RussianRoulette
//    Return L_dir + L_indir

}