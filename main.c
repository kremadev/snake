#include <ncurses.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct {int x, y; } vec2;

int score = 0;
vec2 segments[256];

int main() {
	int scrwidth = 40;
	int scrheight = 20;
	WINDOW *win = initscr();

	keypad(win, true);
	nodelay(win, true);
	curs_set(0);

	vec2 head = {0, 0};
	vec2 dir = {1, 0};

	vec2 berry = {rand() % scrwidth, rand() % scrheight};

	while(true) {
		getmaxyx(win, scrheight, scrwidth);
		int press = wgetch(win);
		if (press == KEY_LEFT) {
			if (dir.x == 1) continue;
			dir.x = -1;
			dir.y = 0;
		}
		if (press == KEY_RIGHT) {
			if (dir.x == -1) continue;
			dir.x = 1;
			dir.y = 0;
		}
		if (press == KEY_UP) {
			if (dir.y == 1) continue;
			dir.x = 0;
			dir.y = -1;
		}
		if (press == KEY_DOWN) {
			if (dir.y == -1) continue;
			dir.x = 0;
			dir.y = 1;
		}
		if (press == '\e') {
			break;
		}

		for (int i = score; i > 0; i--) {
			segments[i] = segments[i - 1];
		}

		segments[0] = head;

		head.x = (dir.x + head.x);
		head.y = (dir.y + head.y);

		if (head.x == berry.x && head.y == berry.y) {
			score += 1;

			berry.x = rand() % scrwidth;
			berry.y = rand() % scrheight;
		} 

		erase();

		mvaddch(berry.y, berry.x * 2, 'M');
		for (int i = 0; i < score; i++) {
			mvaddch(segments[i].y, segments[i].x * 2, 'C');
		}
		mvaddch(head.y, head.x * 2, 'R');
		mvprintw(0, scrwidth / 2, "%d", score);

		usleep(125000);
	}

	endwin();
	return 0;
}
