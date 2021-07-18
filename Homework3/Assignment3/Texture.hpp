//
// Created by LEI XU on 4/27/19.
//

#ifndef RASTERIZER_TEXTURE_H
#define RASTERIZER_TEXTURE_H
#include "global.hpp"
#include <eigen3/Eigen/Eigen>
#include <opencv2/opencv.hpp>
class Texture{
private:
    cv::Mat image_data;

public:
    Texture(const std::string& name)
    {
        image_data = cv::imread(name);
        cv::cvtColor(image_data, image_data, cv::COLOR_RGB2BGR);
        width = image_data.cols;
        height = image_data.rows;
    }

    int width, height;

    Eigen::Vector3f getColor(float u, float v)
    {
        auto u_img = u * width;
        auto v_img = (1 - v) * height;
        auto color = image_data.at<cv::Vec3b>(v_img, u_img);
        return Eigen::Vector3f(color[0], color[1], color[2]);
    }

    Eigen::Vector3f getColorBilinear(float u, float v)
    {

        if(u<0)u=0;
        if(u>1)u=1;
        if(v<0)v=0;
        if(v>1)v=1;

        float x = u*width;
        float y = (1.0f-v)*height;

        float x_min = floor(x);
        float y_min = floor(y);
        float y_max = std::min(float(height),ceil(y));
        float x_max = std::min(float(width),ceil(x));

//        std::cout<<"x:"<<x<<std::endl;
//        std::cout<<"y:"<<x<<std::endl;
//
//        std::cout<<"x_min:"<<x_min<<std::endl;
//        std::cout<<"x_max:"<<x_min<<std::endl;
//
//        std::cout<<"y_min:"<<x_min<<std::endl;
//        std::cout<<"y_max:"<<x_min<<std::endl;

        auto c00 = image_data.at<cv::Vec3b>(y_max,x_min);
        auto c01 = image_data.at<cv::Vec3b>(y_max,x_max);

        auto c10 = image_data.at<cv::Vec3b>(y_min,x_min);
        auto c11 = image_data.at<cv::Vec3b>(y_min,x_max);


        auto top = c00*(1-x+x_min)+c01*(x-x_min);
        auto bot = c10*(1-x+x_min)+c11*(x-x_min);

        auto col = top*(y-y_min)+bot*(1-y+y_min);

        Eigen::Vector3f color = Eigen::Vector3f(col[0],col[1],col[2]);

        return color;
    }
};
#endif //RASTERIZER_TEXTURE_H
