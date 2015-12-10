#ifndef _header
#define _header

#define MAX 38
#define INF         (~(0x1<<31))        // ×î´óÖµ(¼´0X7FFFFFFF)
#define N 1
#define E 2
#define S 3
#define W 4
#define X -1
#define din_f 	int
#define din_i 	int
#define dout_f 	int
#define dout_i 	int
#define num_arrive 0
#define num_stright 1
#define num_turn_right 2
#define num_turn_left 3
#define num_turn_back 4
#define num_error -1

void dijkstra(int (*matrix)[MAX], int vs, int prev[MAX], int dist[MAX]);

int find_dict_now(int theta, int init_dict);
int find_dirc(int (*dirMatrix)[MAX], int last_last_point, int last_point, int next_point);

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
	dout_i *last_point);

void top(int accel_x, int accel_y, int yaw, int start_point, int end_point, int *next_dirc);

void odometers(int accel_x, int accel_y, int yaw, int *last_theta, int *first_velocity, int *total_distance, int *theta);

#endif