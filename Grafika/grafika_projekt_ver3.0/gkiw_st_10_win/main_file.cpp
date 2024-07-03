/*
Niniejszy program jest wolnym oprogramowaniem; możesz go
rozprowadzać dalej i / lub modyfikować na warunkach Powszechnej
Licencji Publicznej GNU, wydanej przez Fundację Wolnego
Oprogramowania - według wersji 2 tej Licencji lub(według twojego
wyboru) którejś z późniejszych wersji.

Niniejszy program rozpowszechniany jest z nadzieją, iż będzie on
użyteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domyślnej
gwarancji PRZYDATNOŚCI HANDLOWEJ albo PRZYDATNOŚCI DO OKREŚLONYCH
ZASTOSOWAŃ.W celu uzyskania bliższych informacji sięgnij do
Powszechnej Licencji Publicznej GNU.

Z pewnością wraz z niniejszym programem otrzymałeś też egzemplarz
Powszechnej Licencji Publicznej GNU(GNU General Public License);
jeśli nie - napisz do Free Software Foundation, Inc., 59 Temple
Place, Fifth Floor, Boston, MA  02110 - 1301  USA
*/

#define GLM_FORCE_RADIANS
#define GLM_FORCE_SWIZZLE

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <stdlib.h>
#include <stdio.h>
#include "constants.h"
#include "lodepng.h"
#include "shaderprogram.h"
#include "myCube.h"
//#include "myTeapot.h"

#include "nogalewa.h"
#include "nogaprawa.h"
#include "rekalewa.h"
#include "rekaprawa.h"
#include "glowa.h"
#include "stopalewa.h"
#include "stopaprawa.h"
#include "tors.h"
#include "dlonlewa.h"
#include "dlonprawa.h"
#include "myCube.h"
//#include "cavecrystal.h"
//#include "kolumna.h"
//#include "lawka.h"
//#include "krzeslo.h"

//zmienne globalne 
float speed_x=0;
float speed_y=0;
float aspectRatio=1;
glm::vec3 cameraPos = glm::vec3(0.f, 6.f, 20.f);
glm::vec3 cameraFront = glm::vec3(0.0f, 0.0f, -1.0f);
glm::vec3 cameraUp = glm::vec3(0.0f, 1.0f, 0.0f);
ShaderProgram *sp;
bool FirstMouse = true;
float lastX = 1920.0f / 2.0;
float lastY = 1080.0 / 2.0;
float yaw = -90.0f;
float pitch = 0.0f;
float fov = 90.0f; 
float glowaspeed = 0;
float rotatespeed = 0;
float robotspeedy = 0;
float robotspeedx = 0;
float angle = 0;
GLuint tex[4];
//Odkomentuj, żeby rysować kostkę
//float* vertices = myCubeVertices;
//float* normals = myCubeNormals;
//float* texCoords = myCubeTexCoords;
//float* colors = myCubeColors;
//int vertexCount = myCubeVertexCount;

// cavecrystal
//float* verticescavecrystal = cavecrystalPositions;
//float* normalscavecrystal = cavecrystalNormals;
//float* texCoordscavecrystal = cavecrystalTexels;
//float* colorscavecrystal = cavecrystalColors;
//int vertexCountcavecrystal = cavecrystalVertices;


// lawka
//float* verticeslawka = lawkaPositions;
//float* normalslawka = lawkaNormals;
//float* texCoordslawka = lawkaTexels;
//float* colorslawka = lawkaColors;
//int vertexCountlawka = lawkaVertices;

//kolumna
//float* verticeskolumna = kolumnaPositions;
//float* normalskolumna = kolumnaNormals;
//float* texCoordskolumna = kolumnaTexels;
//float* colorskolumna = kolumnaColors;
//int vertexCountkolumna = kolumnaVertices;


//krzeslo
//float* verticeskrzeslo = krzesloPositions;
//float* normalskrzeslo = krzesloNormals;
//float* texCoordskrzeslo = krzesloTexels;
//float* colorskrzeslo = krzesloColors;
//int vertexCountkrzeslo = krzesloVertices;



//podloga
float* verticesp = myCubeVertices;
float* normalsp = myCubeNormals;
float* texCoordsp = myCubeTexCoords;
float* colorsp = myCubeColors;
int vertexCountp = myCubeVertexCount;

//lewa dlon
float* verticesdl = dlonlewaPositions;
float* normalsdl = dlonlewaNormals;
float* texCoordsdl = dlonlewaTexels;
float* colorsdl = dlonlewaColors;
int vertexCountdl = dlonlewaVertices;

//prawa dlon
float* verticespd = dlonprawaPositions;
float* normalspd = dlonprawaNormals;
float* texCoordspd = dlonprawaTexels;
float* colorspd = dlonprawaColors;
int vertexCountpd = dlonprawaVertices;

//glowa
float* verticesg = glowaPositions;
float* normalsg = glowaNormals;
float* texCoordsg = glowaTexels;
float* colorsg = glowaColors;
int vertexCountg = glowaVertices;

//noga lewa
float* verticesnl = nogalewaPositions;
float* normalsnl = nogalewaNormals;
float* texCoordsnl = nogalewaTexels;
float* colorsnl = nogalewaColors;
int vertexCountnl = nogalewaVertices;

//noga prawa
float* verticesnp = nogaprawaPositions;
float* normalsnp = nogaprawaNormals;
float* texCoordsnp = nogaprawaTexels;
float* colorsnp = nogaprawaColors;
int vertexCountnp = nogaprawaVertices;

//reka lewa
float* verticesrl = rekalewaPositions;
float* normalsrl = rekalewaNormals;
float* texCoordsrl = rekalewaTexels;
float* colorsrl = rekalewaColors;
int vertexCountrl = rekalewaVertices;

//reka prawa
float* verticesrp = rekaprawaPositions;
float* normalsrp = rekaprawaNormals;
float* texCoordsrp = rekaprawaTexels;
float* colorsrp = rekaprawaColors;
int vertexCountrp = rekaprawaVertices;

//stopa lewa
float* verticessl = stopalewaPositions;
float* normalssl = stopalewaNormals;
float* texCoordssl = stopalewaTexels;
float* colorssl = stopalewaColors;
int vertexCountsl = stopalewaVertices;

//stopa prawa
float* verticessp = stopaprawaPositions;
float* normalssp = stopaprawaNormals;
float* texCoordssp = stopaprawaTexels;
float* colorssp = stopaprawaColors;
int vertexCountsp = stopaprawaVertices;

//tors
float* verticest = torsPositions;
float* normalst = torsNormals;
float* texCoordst= torsTexels;
float* colorst = torsColors;
int vertexCountt = torsVertices;


GLuint readTexture(const char* filename) {
	GLuint tex;
	glActiveTexture(GL_TEXTURE0);
	//Wczytanie do pamięci komputera
	std::vector<unsigned char> image; //Alokuj wektor do wczytania obrazka
	unsigned width, height; //Zmienne do których wczytamy wymiary obrazka
	//Wczytaj obrazek
	unsigned error = lodepng::decode(image, width, height, filename);
	//Import do pamięci karty graficznej
	glGenTextures(1, &tex); //Zainicjuj jeden uchwyt
	glBindTexture(GL_TEXTURE_2D, tex); //Uaktywnij uchwyt
	//Wczytaj obrazek do pamięci KG skojarzonej z uchwytem
	glTexImage2D(GL_TEXTURE_2D, 0, 4, width, height, 0,
		GL_RGBA, GL_UNSIGNED_BYTE, (unsigned char*)image.data());
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	return tex;
}

//Procedura obsługi błędów
void error_callback(int error, const char* description) {
	fputs(description, stderr);
}


void keyCallback(GLFWwindow* window,int key,int scancode,int action,int mods) {
	float cameraSpeed = 0.8f;
	if (action==GLFW_PRESS) {
        if (key==GLFW_KEY_LEFT) rotatespeed=-PI/2;
		if (key == GLFW_KEY_RIGHT) rotatespeed = PI / 2;
        if (key==GLFW_KEY_UP) speed_y=PI/2; //machanie rekami i nogami
        if (key==GLFW_KEY_DOWN) speed_y=-PI/2;
		if (key == GLFW_KEY_K) glowaspeed = PI / 2;
		if (key == GLFW_KEY_L) glowaspeed = -PI / 2;
		if (key == GLFW_KEY_UP) robotspeedx = PI ; //predkosc chodzenia
		if (key == GLFW_KEY_DOWN)  robotspeedx = -PI ;
		
		/*if (key == GLFW_KEY_RIGHT) robotspeedy = -PI ;
		if (key == GLFW_KEY_LEFT)  robotspeedy = PI;*/
		// do rotate m
		/*if (key == GLFW_KEY_UP) angle = 0;
		if (key == GLFW_KEY_DOWN)  angle = PI;
		if (key == GLFW_KEY_RIGHT) angle = -PI / 2;
		if (key == GLFW_KEY_LEFT)  angle = PI / 2;*/
	}
    if (action==GLFW_RELEASE) {
        if (key==GLFW_KEY_LEFT) rotatespeed =0;
        if (key==GLFW_KEY_RIGHT) rotatespeed =0;
        if (key==GLFW_KEY_UP) speed_y=0;
        if (key==GLFW_KEY_DOWN) speed_y=0;
		if (key == GLFW_KEY_K) glowaspeed = 0;
		if (key == GLFW_KEY_L) glowaspeed = 0;
		if (key == GLFW_KEY_UP) robotspeedx = 0;
		if (key == GLFW_KEY_DOWN)  robotspeedx = 0;
		/*if (key == GLFW_KEY_RIGHT) robotspeedy =0;
		if (key == GLFW_KEY_LEFT)  robotspeedy = 0;*/
		//do rotate m
		/*if (key == GLFW_KEY_UP) angle = PI;
		if (key == GLFW_KEY_DOWN)  angle = -PI ;
		if (key == GLFW_KEY_RIGHT) angle = -PI / 2;
		if (key == GLFW_KEY_LEFT)  angle = PI / 2;*/
    }
	if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
		cameraPos += cameraSpeed * cameraFront;
	if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
		cameraPos -= cameraSpeed * cameraFront;
	if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
		cameraPos -= glm::normalize(glm::cross(cameraFront, cameraUp)) * cameraSpeed;
	if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
		cameraPos += glm::normalize(glm::cross(cameraFront, cameraUp)) * cameraSpeed;
	if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
		glfwSetWindowShouldClose(window, GLFW_TRUE);
	}
}

void scroll_callback(GLFWwindow* window, double xoffset, double yoffset)
{
	if (fov >= 1.0f && fov <= 90.0f)
		fov -= yoffset;
	if (fov <= 1.0f)
		fov = 1.0f;
	if (fov >= 90.0f)
		fov = 90.0f;
}
void mouse_callback(GLFWwindow* window, double xpos, double ypos)
{
	if (FirstMouse)
	{
		lastX = xpos;
		lastY = ypos;
		FirstMouse = false;
	}

	GLfloat xoffset = xpos - lastX;
	GLfloat yoffset = lastY - ypos;
	lastX = xpos;
	lastY = ypos;

	GLfloat sensitivity = 0.05;
	xoffset *= sensitivity;
	yoffset *= sensitivity;

	yaw += xoffset;
	pitch += yoffset;

	if (pitch > 89.0f)
		pitch = 89.0f;
	if (pitch < -89.0f)
		pitch = -89.0f;

	glm::vec3 front;
	front.x = cos(glm::radians(yaw)) * cos(glm::radians(pitch));
	front.y = sin(glm::radians(pitch));
	front.z = sin(glm::radians(yaw)) * cos(glm::radians(pitch));
	cameraFront = glm::normalize(front);
}
void windowResizeCallback(GLFWwindow* window,int width,int height) {
    if (height==0) return;
    aspectRatio=(float)width/(float)height;
    glViewport(0,0,width,height);
}

//Procedura inicjująca
void initOpenGLProgram(GLFWwindow* window) {
	//************Tutaj umieszczaj kod, który należy wykonać raz, na początku programu************
	glClearColor(0,0.6,0.6,1);
	glEnable(GL_DEPTH_TEST);
	glfwSetWindowSizeCallback(window,windowResizeCallback);
	glfwSetKeyCallback(window,keyCallback);
	glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
	glfwSetCursorPosCallback(window, mouse_callback);
	glfwSetScrollCallback(window, scroll_callback);
	
	
	tex[0] = readTexture("WickerIndividualSimpleRattan001_COL_2K.png");
	tex[1] = readTexture("czarne.png");
	//tex[2] = readTexture("StoneMarbleCalacatta004_COL_2K.png");   test tekstury robota
	tex[2] = readTexture("cialo.png");
	tex[3] = readTexture("WoodFlooring044_COL_2K.png");
	sp=new ShaderProgram("v_simplest.glsl",NULL,"f_simplest.glsl");
	
}


//Zwolnienie zasobów zajętych przez program
void freeOpenGLProgram(GLFWwindow* window) {
    //************Tutaj umieszczaj kod, który należy wykonać po zakończeniu pętli głównej************

    delete sp;
}




//Procedura rysująca zawartość sceny
void drawScene(GLFWwindow* window,float angle_x,float angle_y, float glowaangle, float anglex, float angley, float bodyangle) {
	//************Tutaj umieszczaj kod rysujący obraz******************l
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);


	glm::mat4 V = glm::lookAt(cameraPos, cameraPos + cameraFront, cameraUp);

	/*glm::mat4 V = glm::lookAt(
         glm::vec3(0, 6, 20),
         glm::vec3(0,6,0),
         glm::vec3(0.0f,1.0f,0.0f)); //Wylicz macierz widoku*/

    glm::mat4 P=glm::perspective(glm::radians(fov), aspectRatio, 0.1f, 100.0f); //Wylicz macierz rzutowania, zamiast radians fov bylo '50.0f*PI/180.0f'

    glm::mat4 M=glm::mat4(1.0f);
	//M=glm::rotate(M,angle_y,glm::vec3(1.0f,0.0f,0.0f)); //Wylicz macierz modelu
	//M=glm::rotate(M,angle_x,glm::vec3(0.0f,1.0f,0.0f)); //Wylicz macierz modelu
	M = glm::rotate(M, angle, glm::vec3(0.0f, 1.0f, 0.0f));
	M = glm::translate(M, glm::vec3(angley , 0.0f, anglex));
	
	//M = glm::translate(M, glm::vec3(-angley, 0.f, -anglex));
    sp->use();//Aktywacja programu cieniującego
    //Przeslij parametry programu cieniującego do karty graficznej
    glUniformMatrix4fv(sp->u("P"),1,false,glm::value_ptr(P));
    glUniformMatrix4fv(sp->u("V"),1,false,glm::value_ptr(V));
    glUniformMatrix4fv(sp->u("M"),1,false,glm::value_ptr(M));

    glEnableVertexAttribArray(sp->a("vertex"));  //Włącz przesyłanie danych do atrybutu vertex
	glEnableVertexAttribArray(sp->a("normal"));  //Włącz przesyłanie danych do atrybutu normal
	glEnableVertexAttribArray(sp->a("color"));  //Włącz przesyłanie danych do atrybutu color
	glEnableVertexAttribArray(sp->a("texCoord0"));
	glUniform1i(sp->u("textureMap0"), 0); //drawScene
	glActiveTexture(GL_TEXTURE0);



	glBindTexture(GL_TEXTURE_2D, tex[2]);
	//tors
	glm::mat4 TORS = M;
	//TORS = glm::translate(TORS, glm::vec3(0.012294f, -0.000001f, 6.39811f));
	//TORS = glm::translate(TORS, glm::vec3(-0.012294f, 0.000001f, -6.39811f));
	TORS = glm::rotate(TORS, bodyangle, glm::vec3(0.0f, 1.0f, 0.0f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(TORS));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticest); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorst); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalst); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"),2, GL_FLOAT, false, 0, texCoordst);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountt); //Narysuj obiekt


	glBindTexture(GL_TEXTURE_2D, tex[1]);
	//reka lewa
	glm::mat4 RL = TORS;
	RL = glm::translate(RL, glm::vec3(1.59009f, 6.3447f , -0.000546f));
	RL = glm::rotate(RL, sin(angle_y), glm::vec3(1.0f, 0.0f, 0.0f));
	RL = glm::translate(RL, glm::vec3(-1.59009f, -6.3447f, 0.000546f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(RL));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticesrl); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsrl); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalsrl); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordsrl);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountrl); //Narysuj obiekt


	//reka prawa
	glm::mat4 RP = TORS;
	RP = glm::translate(RP, glm::vec3(-1.6051f, 6.34013f , -0.000001f));
	RP = glm::rotate(RP, sin(angle_y), glm::vec3(-1.0f, 0.0f, 0.0f));
	RP = glm::translate(RP, glm::vec3(1.6051f, -6.34013f, 0.000001f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(RP));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticesrp); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsrp); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalsrp); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"),2, GL_FLOAT, false, 0, texCoordsrp);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountrp); //Narysuj obiekt


	glBindTexture(GL_TEXTURE_2D, tex[2]);
	// dlon lewa
	glm::mat4 DL = RL;
	DL = glm::translate(DL, glm::vec3(1.6287f, 4.97181f, 0.001129f));
	DL = glm::rotate(DL, sin(angle_y)/2, glm::vec3(1.0f, 0.0f, 0.0f));
	DL = glm::translate(DL, glm::vec3(-1.6287f, -4.97181f, -0.001129f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(DL));
    glVertexAttribPointer(sp->a("vertex"),3,GL_FLOAT,false,0, verticesdl); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsdl); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalsdl); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordsdl);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountdl); //Narysuj obiekt
	

	//dlon prawa
	glm::mat4 DP = RP;
	DP = glm::translate(DP, glm::vec3(-1.62827f, 4.96343f, 0.001129f));
	DP = glm::rotate(DP, sin(angle_y)/2, glm::vec3(-1.0f, 0.0f, 0.0f));
	DP = glm::translate(DP, glm::vec3(1.62827f, -4.96343f, -0.001129f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(DP));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticespd); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorspd); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalspd); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordspd);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountpd); //Narysuj obiekt
	
	glBindTexture(GL_TEXTURE_2D, tex[1]);
	//glowa
	glm::mat4 GLOWA = TORS;
	GLOWA = glm::rotate(GLOWA, glowaangle, glm::vec3(0.0f, 1.0f, 0.0f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(GLOWA));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticesg); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsg); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalsg); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordsg);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountg); //Narysuj obiekt
	
	glBindTexture(GL_TEXTURE_2D, tex[1]);
	//noga lewa
	glm::mat4 NL = TORS;
	NL = glm::translate(NL, glm::vec3(0.894764f, 4.57024f, 0.010293f));
	NL = glm::rotate(NL, sin(angle_y), glm::vec3(-1.0f, 0.0f, 0.0f));
	NL = glm::translate(NL, glm::vec3(-0.894764f, -4.57024f, -0.010293f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(NL));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticesnl); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsnl); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalsnl); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordsnl);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountnl); //Narysuj obiekt


	//noga prawa
	glm::mat4 NP = TORS;
	NP = glm::translate(NP, glm::vec3(-0.900569f, 4.57682f, 0.004117f));
	NP = glm::rotate(NP, sin(angle_y), glm::vec3(1.0f, 0.0f, 0.0f));
	NP = glm::translate(NP, glm::vec3(0.900569f, -4.57682f, -0.004117f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(NP));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticesnp); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsnp); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalsnp); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordsnp);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountnp); //Narysuj obiekt
	
	glBindTexture(GL_TEXTURE_2D, tex[2]);
	//stopa lewa
	glm::mat4 SL = NL;
	SL = glm::translate(SL, glm::vec3(0.913957f, 2.3048f, -0.006519f));
	SL = glm::rotate(SL, sin(angle_y)/2.5f, glm::vec3(-1.f, 0.0f, 0.0f));
	SL = glm::translate(SL, glm::vec3(-0.913957f, -2.3048f, 0.006519f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(SL));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticessl); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorssl); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalssl); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordssl);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountsl); //Narysuj obiekt


	//stopa prawa
	glm::mat4 SP = NP;
	SP = glm::translate(SP, glm::vec3(-0.902895f, 2.30808f, -0.f));
	SP = glm::rotate(SP, sin(angle_y)/2.5f, glm::vec3(1.f, 0.0f, 0.0f));
	SP = glm::translate(SP, glm::vec3(0.902895f, -2.30808f, 0.f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(SP));
	glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticessp); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorssp); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalssp); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordssp);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountsp); //Narysuj obiekt
	
	glBindTexture(GL_TEXTURE_2D, tex[0]);

	// do podłogi
	glm::mat4 Mfloor = glm::mat4(1.0f);
	Mfloor = glm::translate(Mfloor, glm::vec3(0.f,-1.f, 0.f));
	Mfloor = glm::scale(Mfloor, glm::vec3(150.f,1.f, 150.f));
	glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(Mfloor));
	glVertexAttribPointer(sp->a("vertex"), 4, GL_FLOAT, false, 0, verticesp); //Wskaż tablicę z danymi dla atrybutu vertex
	glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorsp); //Wskaż tablicę z danymi dla atrybutu color
	glVertexAttribPointer(sp->a("normal"), 4, GL_FLOAT, false, 0, normalsp); //Wskaż tablicę z danymi dla atrybutu normal
	glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordsp);//odpowiednia tablica
	glDrawArrays(GL_TRIANGLES, 0, vertexCountp); //Narysuj obiekt
	//glBindTexture(GL_TEXTURE_2D, tex[0]);

	//	// lawka
	//glm::mat4 lawka = glm::mat4(1.0f);
	//lawka = glm::translate(lawka, glm::vec3(-15.f, 0.5f, -25.f));
	//lawka = glm::scale(lawka, glm::vec3(13.f, 13.f, 13.f));
	//glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(lawka));
	//glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticeslawka); //Wskaż tablicę z danymi dla atrybutu vertex
	//glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorslawka); //Wskaż tablicę z danymi dla atrybutu color
	//glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalslawka); //Wskaż tablicę z danymi dla atrybutu normal
	//glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordslawka);//odpowiednia tablica
	//glDrawArrays(GL_TRIANGLES, 0, vertexCountlawka); //Narysuj obiekt

	//glBindTexture(GL_TEXTURE_2D, tex[1]);

	//	// kolumna
	//glm::mat4 kolumna = glm::mat4(1.0f);
	//kolumna = glm::translate(kolumna, glm::vec3(-15.f, 0.f, 15.f));
	//kolumna = glm::scale(kolumna, glm::vec3(550.f, 550.f, 550.f));
	//glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(kolumna));
	//glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticeskolumna); //Wskaż tablicę z danymi dla atrybutu vertex
	//glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorskolumna); //Wskaż tablicę z danymi dla atrybutu color
	//glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalskolumna); //Wskaż tablicę z danymi dla atrybutu normal
	//glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordskolumna);//odpowiednia tablica
	//glDrawArrays(GL_TRIANGLES, 0, vertexCountkolumna); //Narysuj obiekt


	//glBindTexture(GL_TEXTURE_2D, tex[0]);
	//	// krzeslo
	//glm::mat4 krzeslo = glm::mat4(1.0f);
	//krzeslo = glm::translate(krzeslo, glm::vec3(40.f, 0.f, -20.f));
	//krzeslo = glm::scale(krzeslo, glm::vec3(6.f, 6.f, 6.f));
	//glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(krzeslo));
	//glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticeskrzeslo); //Wskaż tablicę z danymi dla atrybutu vertex
	//glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorskrzeslo); //Wskaż tablicę z danymi dla atrybutu color
	//glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalskrzeslo); //Wskaż tablicę z danymi dla atrybutu normal
	//glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordskrzeslo);//odpowiednia tablica
	//glDrawArrays(GL_TRIANGLES, 0, vertexCountkrzeslo); //Narysuj obiekt

	//glBindTexture(GL_TEXTURE_2D, tex[1]);

	//// cavecrystal
	//glm::mat4 cavecrystal = glm::mat4(1.0f);
	//cavecrystal = glm::translate(cavecrystal, glm::vec3(20.f, -1.f, 20.f));
	//cavecrystal = glm::scale(cavecrystal, glm::vec3(0.1f,0.1f, 0.1f));
	//glUniformMatrix4fv(sp->u("M"), 1, false, glm::value_ptr(cavecrystal));
	//glVertexAttribPointer(sp->a("vertex"), 3, GL_FLOAT, false, 0, verticescavecrystal); //Wskaż tablicę z danymi dla atrybutu vertex
	//glVertexAttribPointer(sp->a("color"), 4, GL_FLOAT, false, 0, colorscavecrystal); //Wskaż tablicę z danymi dla atrybutu color
	//glVertexAttribPointer(sp->a("normal"), 3, GL_FLOAT, false, 0, normalscavecrystal); //Wskaż tablicę z danymi dla atrybutu normal
	//glVertexAttribPointer(sp->a("texCoord0"), 2, GL_FLOAT, false, 0, texCoordscavecrystal);//odpowiednia tablica
	//glDrawArrays(GL_TRIANGLES, 0, vertexCountcavecrystal); //Narysuj obiekt




	glDisableVertexAttribArray(sp->a("vertex"));  //Wyłącz przesyłanie danych do atrybutu vertex
	glDisableVertexAttribArray(sp->a("color"));  //Wyłącz przesyłanie danych do atrybutu color
	glDisableVertexAttribArray(sp->a("normal"));  //Wyłącz przesyłanie danych do atrybutu normal
	glDisableVertexAttribArray(sp->a("texCoord0"));  //Wyłącz przesyłanie danych do atrybutu texCoord0
	
    glfwSwapBuffers(window); //Przerzuć tylny bufor na przedni
}


int main(void)
{
	GLFWwindow* window; //Wskaźnik na obiekt reprezentujący okno

	glfwSetErrorCallback(error_callback);//Zarejestruj procedurę obsługi błędów

	if (!glfwInit()) { //Zainicjuj bibliotekę GLFW
		fprintf(stderr, "Nie można zainicjować GLFW.\n");
		exit(EXIT_FAILURE);
	}

	window = glfwCreateWindow(1200, 1200, "OpenGL", NULL, NULL);  //Utwórz okno 500x500 o tytule "OpenGL" i kontekst OpenGL.

	if (!window) //Jeżeli okna nie udało się utworzyć, to zamknij program
	{
		fprintf(stderr, "Nie można utworzyć okna.\n");
		glfwTerminate();
		exit(EXIT_FAILURE);
	}

	glfwMakeContextCurrent(window); //Od tego momentu kontekst okna staje się aktywny i polecenia OpenGL będą dotyczyć właśnie jego.
	glfwSwapInterval(1); //Czekaj na 1 powrót plamki przed pokazaniem ukrytego bufora

	if (glewInit() != GLEW_OK) { //Zainicjuj bibliotekę GLEW
		fprintf(stderr, "Nie można zainicjować GLEW.\n");
		exit(EXIT_FAILURE);
	}

	initOpenGLProgram(window); //Operacje inicjujące

	//Główna pętla
	float angle_x=0; //Aktualny kąt obrotu obiektu
	float angle_y=0; //Aktualny kąt obrotu obiektu
	float anglex = 0;
	float angley = 0;
	float glowaangle = 0;
	float bodyangle = 0;

	glfwSetTime(0); //Zeruj timer
	while (!glfwWindowShouldClose(window)) //Tak długo jak okno nie powinno zostać zamknięte
	{
		anglex += robotspeedx*glfwGetTime();
		angley += robotspeedy*glfwGetTime();
		glowaangle += glowaspeed * glfwGetTime();
		bodyangle += rotatespeed * glfwGetTime();
        angle_x+=speed_x*glfwGetTime(); //Zwiększ/zmniejsz kąt obrotu na podstawie prędkości i czasu jaki upłynał od poprzedniej klatki
        angle_y+=speed_y*glfwGetTime(); //Zwiększ/zmniejsz kąt obrotu na podstawie prędkości i czasu jaki upłynał od poprzedniej klatki
        glfwSetTime(0); //Zeruj timer
		drawScene(window,angle_x,angle_y, glowaangle, anglex, angley, bodyangle); //Wykonaj procedurę rysującą
		glfwPollEvents(); //Wykonaj procedury callback w zalezności od zdarzeń jakie zaszły.
	}

	freeOpenGLProgram(window);

	glfwDestroyWindow(window); //Usuń kontekst OpenGL i okno
	glfwTerminate(); //Zwolnij zasoby zajęte przez GLFW
	exit(EXIT_SUCCESS);
}
