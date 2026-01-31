#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <stdio.h>

int glInit() {
  if (glfwInit() == GLFW_FALSE) {
    fprintf(stderr, "glfw init failed\n");
    return -1;
  }
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  return 0;
}

void glQuit() {
  printf("gl quit\n");
  glfwTerminate();
}
