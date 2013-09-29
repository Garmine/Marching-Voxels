#version 330

uniform samplerBuffer colors;

flat in int instanceID;

out vec4 color;

void main(){
	color = texelFetch(colors, instanceID);
}
