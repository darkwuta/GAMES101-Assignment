#include <chrono>
#include <iostream>
#include <opencv2/opencv.hpp>

static int click_num =5;

std::vector<cv::Point2f> control_points;

void mouse_handler(int event, int x, int y, int flags, void *userdata) 
{
    if (event == cv::EVENT_LBUTTONDOWN && control_points.size() < click_num)
    {
        std::cout << "Left button of the mouse is clicked - position (" << x << ", "
        << y << ")" << '\n';
        control_points.emplace_back(x, y);
    }     
}

void naive_bezier(const std::vector<cv::Point2f> &points, cv::Mat &window) 
{
    auto &p_0 = points[0];
    auto &p_1 = points[1];
    auto &p_2 = points[2];
    auto &p_3 = points[3];

    for (double t = 0.0; t <= 1.0; t += 0.001) 
    {
        auto point = std::pow(1 - t, 3) * p_0 + 3 * t * std::pow(1 - t, 2) * p_1 +
                 3 * std::pow(t, 2) * (1 - t) * p_2 + std::pow(t, 3) * p_3;

        window.at<cv::Vec3b>(point.y, point.x)[2] = 255;
    }
}

cv::Point2f recursive_bezier(const std::vector<cv::Point2f> &control_points, float t) 
{
    // TODO: Implement de Casteljau's algorithm
    if(control_points.size()==2)
    {
        return control_points[0]+t*(control_points[1]-control_points[0]);
    }
    else
    {
        std::vector<cv::Point2f> vec;
        for(int i=0;i<control_points.size()-1;i++)
            vec.push_back(control_points[i]+t*(control_points[i+1]-control_points[i]));
        return recursive_bezier(vec,t);
    }
    return cv::Point2f();

}

void bezier(const std::vector<cv::Point2f> &control_points, cv::Mat &window) 
{
    // TODO: Iterate through all t = 0 to t = 1 with small steps, and call de Casteljau's
    for(double t=0.0;t<1.0;t+=0.0001)
    {
        cv::Point2f point = recursive_bezier(control_points,t);

        cv::Point2f point00 = cv::Point2f(floor(point.x)+0.5,floor(point.y)+0.5);
        cv::Point2f point01 = cv::Point2f(floor(point.x)+0.5,floor(point.y)+1.5);
        cv::Point2f point10 = cv::Point2f(floor(point.x)+1.5,floor(point.y)+0.5);
        cv::Point2f point11 = cv::Point2f(floor(point.x)+1.5,floor(point.y)+1.5);

        float min = std::numeric_limits<float>::min();

        std::vector<float> lens;
        lens.push_back(norm((point00-point)));
        lens.push_back(norm((point01-point)));
        lens.push_back(norm((point10-point)));
        lens.push_back(norm((point11-point)));

        std::sort(lens.begin(),lens.end());//升序



        window.at<cv::Vec3b>(point00.y, point00.x)[2] = 255*lens[0]/norm(point00-point);
        window.at<cv::Vec3b>(point01.y, point01.x)[2] = 255*lens[0]/norm(point01-point);
        window.at<cv::Vec3b>(point10.y, point10.x)[2] = 255*lens[0]/norm(point10-point);
        window.at<cv::Vec3b>(point11.y, point11.x)[2] = 255*lens[0]/norm(point11-point);
    }
    // recursive Bezier algorithm.

}

int main() 
{
    cv::Mat window = cv::Mat(700, 700, CV_8UC3, cv::Scalar(0));
    cv::cvtColor(window, window, cv::COLOR_BGR2RGB);
    cv::namedWindow("Bezier Curve", cv::WINDOW_AUTOSIZE);

    cv::setMouseCallback("Bezier Curve", mouse_handler, nullptr);

    int key = -1;
    while (key != 27) 
    {
        for (auto &point : control_points) 
        {
            cv::circle(window, point, 3, {255, 255, 255}, 3);
        }

        if (control_points.size() == click_num)
        {
            //naive_bezier(control_points, window);
            bezier(control_points, window);

            cv::imshow("Bezier Curve", window);
            cv::imwrite("my_bezier_curve.png", window);
            key = cv::waitKey(0);

            return 0;
        }

        cv::imshow("Bezier Curve", window);
        key = cv::waitKey(20);
    }

return 0;
}
