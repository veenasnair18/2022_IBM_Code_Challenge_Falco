#include <ros/ros.h>
#include <darknet_ros_msgs/BoundingBoxes.h>
#include <gnc_functions.hpp>

int height = 4;
int isPersonDetected = 0;

void detection_cb(const darknet_ros_msgs::BoundingBoxes::ConstPtr& msg)
{
	for( int i=0; i < msg->bounding_boxes.size(); i++)
	{
		ROS_INFO("%s detected", msg->bounding_boxes[i].Class.c_str());	
		if(msg->bounding_boxes[i].Class == "car" || msg->bounding_boxes[i].Class == "truck"|| msg->bounding_boxes[i].Class == "bus")
		{
			height = 10;
			ROS_INFO("Obstacle Detected..!");
			
		}
		if(msg->bounding_boxes[i].Class == "person")
		{
			isPersonDetected = 1;
			
		}
	}	

}


int main(int argc, char **argv)
{
	//initialize ros 
	ros::init(argc, argv, "gnc_node");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("/darknet_ros/bounding_boxes", 1, detection_cb);
	//initialize control publisher/subscribers
	init_publisher_subscriber(n);

  	// wait for FCU connection
	wait4connect();

	//wait for used to switch to mode GUIDED
	wait4start();

	//create local reference frame 
	initialize_local_frame();

	//request takeoff
	takeoff(4);


	//specify some waypoints 
	std::vector<gnc_api_waypoint> waypointList;
	gnc_api_waypoint nextWayPoint;
	nextWayPoint.x = 0;
	nextWayPoint.y = 0;
	nextWayPoint.z = 4;
	nextWayPoint.psi = -180;
	waypointList.push_back(nextWayPoint);
	for(int i = 0; i > -13;i-- ){
		nextWayPoint.x = 0;
		nextWayPoint.y = i;
		nextWayPoint.z = height;
		nextWayPoint.psi = -180;
		waypointList.push_back(nextWayPoint);
	}
	nextWayPoint.x = 10;
	nextWayPoint.y = -16;
	nextWayPoint.z = 4;
	nextWayPoint.psi = -90;
	waypointList.push_back(nextWayPoint);
	nextWayPoint.x = 10;
	nextWayPoint.y = -32;
	nextWayPoint.z = 4;
	nextWayPoint.psi = 90;
	waypointList.push_back(nextWayPoint);
	for(int i = 10; i > -10;i-- ){
		nextWayPoint.x = i;
		nextWayPoint.y = -32;
		nextWayPoint.z = 4;
		nextWayPoint.psi = 90;
		waypointList.push_back(nextWayPoint);
	}
	
	
	ros::Rate rate(2.0);
	int counter = 0;
	while(ros::ok())
	{
		if(isPersonDetected == 0)
		{
			ros::spinOnce();
			rate.sleep();
			if(check_waypoint_reached(.3) == 1)
			{
				if (counter < waypointList.size())
				{
					if(counter < 14){
						set_destination(waypointList[counter].x,waypointList[counter].y,height, waypointList[counter].psi);
					}else{
						set_destination(waypointList[counter].x,waypointList[counter].y,waypointList[counter].z, waypointList[counter].psi);
					}
					counter++;	
				}
			}
		}
		else
		{
			land();
			ROS_INFO("Landing Started");
			break;
		}	
		
	}

	return 0;
}