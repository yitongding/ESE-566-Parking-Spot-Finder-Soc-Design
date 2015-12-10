#include "Header.h"
#include "math.h"

/*Input: accel_x, accel_y, yaw*/
void top(int accel_x, int accel_y, int yaw, int start_point, int end_point, int *next_dirc)
{
	int matrix[MAX][MAX] = {
		0, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, 1, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF,
		INF, INF, INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 1, INF, INF, INF, INF, INF, 1, INF,
		INF, INF, INF, INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1,
		INF, INF, INF, INF, INF, INF, INF, INF, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, 1,
		1, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, 1, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF, INF, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF, INF, INF, INF,
		INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0, 1, INF, INF,
		INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, 1, INF,
		INF, INF, INF, INF, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 0, INF,
		INF, INF, INF, INF, INF, INF, INF, 1, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 0
	};
	int dirMatrix[MAX][MAX] = {
		0, X, X, X, X, X, X, X, X, E, X, X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, 0, X, X, X, X, X, X, X, X, W, E, X, X, X, X, X, X, X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, 0, X, X, X, X, X, X, X, X, X, X, W, X, X, X, X, X, X, X, X, X, X, X, X, X, S, X, X, X, X, X, X, X, X, X, X,
		X, X, X, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, S, X, X, X, X, X, X, X, X, X, E, X, X, X,
		X, X, X, X, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, S, X, X, X, X, X, W, X,
		X, X, X, X, X, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, E,
		X, X, X, X, X, X, X, X, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, X, X, X, W,
		W, X, X, X, X, X, X, X, X, 0, E, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, E, X, X, X, X, X, X, X, W, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, W, X, X, X, X, X, X, X, X, X, 0, E, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, W, 0, E, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, E, X, X, X, X, X, X, X, X, X, W, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		N, X, X, X, X, X, X, X, X, X, X, X, X, X, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, N, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, N, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, X, X, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, N, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, 0, S, X, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, X, X, X, X, X, X, X, X, X, X, X,
		X, X, N, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, 0, S, X, X, X, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X, X, X, X,
		X, X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, X, X, X, X, X, X, X, X,
		X, X, X, X, N, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, 0, S, X, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, S, X, X, X, X,
		X, X, X, X, X, X, X, X, S, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, N, 0, X, X, X, X,
		X, X, X, W, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, 0, E, X, X,
		X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, W, 0, E, X,
		X, X, X, X, E, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, W, 0, X,
		X, X, X, X, X, X, X, W, E, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, X, 0
	};
	//data need to be stored
	static int distance = 0; 	//total distance moved
	static int theta = 0; 		//total theta turned
	static int last_theta = 0;
	static int first_velocity = 0;
	int total_distance = 0;

	static int init_dict = N;
	static int last_last_point = 5;
	static int last_point = 20;

	odometers(accel_x, accel_y, yaw, &last_theta, &first_velocity, &total_distance, &theta);
	//get next direction 
	calculateDir(matrix, dirMatrix, start_point, end_point, distance, theta, init_dict, next_dirc, &last_last_point, &last_point);

}

/*Input: accel_x, accel_y, yaw; Output: total_distance, theta*/
void odometers(int accel_x, int accel_y, int yaw,
	int *last_theta, int *first_velocity, int *total_distance, int *theta)
{
	int theta_global; 	/* global theta from IMU, radians */
	int accel;      	/* bot Y position in inches */
	int velocity;
	int imu_theta;    	/* change in theta calculate from IMU */
	int distance = 0;
	int t = 5;

	/*calcaulate distance */
	//accel = sqrt(pow(accel_x, 2) + pow(accel_y, 2));
	accel = accel_x/100;
	//accel = sqrt(accel_x[i] * accel_x[i] + accel_y * accel_y);
	velocity = *first_velocity + accel * t/100;
	distance = (*first_velocity + velocity) / 2 * t/100;
	*first_velocity = velocity;
	*total_distance += distance;
	/* read the YAW value from the imu struct and convert to radians */
	//theta_global = ((int)yaw * 2 * pi) / 65536.0;

	/* calculate rotation rate-of-change for stasis detector */
	imu_theta = theta_global - *last_theta;
	*last_theta = theta_global;
	*theta = theta_global;
	//*theta -= (int)(((int)(*theta / (2 * pi))) * 2 * pi);
	//*theta -= (int)(((int)(*theta / (2 * pi))) * 2 * pi);
	/*if (*theta < -pi)
	{
		*theta += 2 * pi;
	}
	else
	{
		if (*theta > pi)
			*theta -= 2 * pi;
	}
	*/
}


void calculateDir(
	din_f (*matrix)[MAX],
	din_i (*dirMatrix)[MAX],
	din_i start_point,
	din_i end_point,
	din_f distance,
	din_f theta,
	din_i init_dict,
	dout_i *next_dirc,
	dout_i *last_last_point,
	dout_i *last_point)
{
	int sptSet[MAX] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	int dist[MAX] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	dijkstra(matrix, end_point, sptSet, dist);

	int total_distance = dist[start_point];
	//int dirc_now = find_dict_now(theta, init_dict);

	if (total_distance == distance)	//arrive the end_point
	{
		next_dirc = num_arrive;
	}
	else if (total_distance - distance < dist[sptSet[*last_point]])
	{
		*next_dirc = num_stright;
		*last_last_point = *last_point;
		*last_point = sptSet[*last_point];
	}
	else if (total_distance - distance == dist[sptSet[*last_point]])
	{
		*next_dirc = find_dirc(dirMatrix, *last_last_point, *last_point, sptSet[*last_point]);//nextdirction
	}
	else
	{
		*next_dirc = num_stright;
	}

}

int find_dirc(int (*dirMatrix)[MAX], int last_last_point, int last_point, int next_point)
{
	int last_dirc = dirMatrix[last_last_point][last_point];
	int next_dirc = dirMatrix[last_point][next_point];
	if (last_dirc == next_dirc)
	{
		return num_stright;
	}
	else if (next_dirc - last_dirc == 1 || next_dirc - last_dirc == -3)
	{
		return num_turn_right;
	}
	else if (next_dirc - last_dirc == -1 || next_dirc - last_dirc == 3)
	{
		return num_turn_left;
	}
	else if (next_dirc - last_dirc == 2 || next_dirc - last_dirc == -2)
	{
		return num_turn_back;
	}
	else
	{
		return num_stright;
	}
}
/*
int find_dict_now(int theta, int init_dict)
{
	int dirc_now;
	if (theta <= pi / 4 || theta > -pi / 4)
	{
		return init_dict;
	}
	else if (theta <= 3 / 4 * pi || theta > pi / 4)
	{
		dirc_now = init_dict + 1;
		if (dirc_now > 4)
		{
			dirc_now -= 4;
		}
		return dirc_now;
	}
	else if (theta > -3 / 4 * pi || theta <= -pi / 4)
	{
		dirc_now = init_dict - 1;
		if (dirc_now < 1)
		{
			dirc_now += 4;
		}
		return dirc_now;
	}
	else
	{
		dirc_now = init_dict + 2;
		if (dirc_now > 4)
		{
			dirc_now -= 4;
		}
		return dirc_now;
	}
}
*/
void dijkstra(int (*matrix)[MAX], int vs, int prev[MAX], int dist[MAX])
{
	int i, j, k;
	int min;
	int tmp;
	int flag[MAX];      // flag[i]=1表示"顶点vs"到"顶点i"的最短路径已成功获取。
	//char vexs[MAX] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i' };
	int vexnum = MAX;

	// 初始化
loop1: for (i = 0; i < vexnum; i++)
{
	flag[i] = 0;              // 顶点i的最短路径还没获取到。
	prev[i] = 0;              // 顶点i的前驱顶点为0。
	dist[i] = matrix[vs][i];// 顶点i的最短路径为"顶点vs"到"顶点i"的权。
}

	   // 对"顶点vs"自身进行初始化
	   flag[vs] = 1;
	   dist[vs] = 0;

	   // 遍历G.vexnum-1次；每次找出一个顶点的最短路径。
   loop2: for (i = 1; i < vexnum; i++)
   {
	   // 寻找当前最小的路径；
	   // 即，在未获取最短路径的顶点中，找到离vs最近的顶点(k)。
	   min = INF;
   loop3: for (j = 0; j < vexnum; j++)
   {
	   if (flag[j] == 0 && dist[j]<min)
	   {
		   min = dist[j];
		   k = j;
	   }
   }
		  // 标记"顶点k"为已经获取到最短路径
		  flag[k] = 1;

		  // 修正当前最短路径和前驱顶点
		  // 即，当已经"顶点k的最短路径"之后，更新"未获取最短路径的顶点的最短路径和前驱顶点"。
	  loop4: for (j = 0; j < vexnum; j++)
	  {
		  tmp = (matrix[k][j] == INF ? INF : (min + matrix[k][j])); // 防止溢出
		  if (flag[j] == 0 && (tmp  < dist[j]))
		  {
			  dist[j] = tmp;
			  prev[j] = k;
		  }
	  }
   }

}



