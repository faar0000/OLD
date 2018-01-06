#include <allegro.h>
#define maxfilas 20
#define maxcols 31
BITMAP *buffer;
BITMAP *roca;
BITMAP *pacbmp;
BITMAP *pacman;

int dir=0;
int px=30*10, py=30*10;


char mapa[maxfilas][maxcols]={
    "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "x                            x",
    "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
};

void dibujar_mapa(){
    int row,col;

    for(row = 0 ; row< maxfilas ; row++){
        for(col = 0;col<maxcols; col++){
            if(mapa[row][col] == "x"){
                draw_sprite(buffer,roca,col*30,row*30);
            }
        }
    }
}

void pantalla(){
    blit(buffer,screen,0,0,0,0,880,600);
}

void dibujar_personaje(){
    blit(pacbmp,pacman,dir*33,0,0,0,33,33);
    draw_sprite(buffer,pacman,px,py);
}

int main()
{
    allegro_init();
    install_keyboard();

    set_color_depth(32);
    set_gfx_mode(GFX_AUTODETECT_WINDOWED,880,600,0,0);

    buffer = create_bitmap(880,600);
    roca = load_bitmap("roca.bmp",NULL);
    pacbmp = load_bitmap("pacman.bmp",NULL);
    pacman = create_bitmap(33,33);

    while(!key[KEY_ESC]){

        if(key[KEY_RIGHT]) dir = 1;  //Mover a pacman
        else if(key[KEY_LEFT]) dir = 0;
        else if(key[KEY_UP]) dir =2;
        else if(key[KEY_DOWN]) dir =3;

        if(dir == 0) px -= 30;
        if(dir == 1) px += 30;
        if(dir == 2) py -= 30;
        if(dir == 3) py += 30;

        clear(buffer);
        dibujar_mapa();
        dibujar_personaje();
        pantalla();
        rest(70);

        clear(pacman);
        blit(pacbmp,pacman,4*33,0,0,0,33,33);
        draw_sprite(buffer,pacman,px,py);
        pantalla();
        rest(90);
        }

}
