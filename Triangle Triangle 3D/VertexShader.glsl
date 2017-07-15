/*
Title: Line - Triangle (3D)
File Name: main.cpp
Copyright � 2015
Original authors: Nicholas Gallagher
Written under the supervision of David I. Schwartz, Ph.D., and
supported by a professional development seed grant from the B. Thomas
Golisano College of Computing & Information Sciences
(https://www.rit.edu/gccis) at the Rochester Institute of Technology.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Description:
This is a demonstration of collision detection between a line and a triangle.
The demo contains a line and a triangle. When the objects are not 
colliding the triangle will appear blue and the line will appear green. When the 
two objects collide the triangle will become pink and the line will become yellow. 

Both shapes are able to be moved, you can move the selected shape in the XY plane with WASD.
You can also move the shape along the Z axis with left shift and left control. The shapes
can be rotated by clicking and dragging the left mouse button. You can swap which shape is 
selected with spacebar. 

This algorithm tests for collisions between a line and an triangle by determining if
the point on the line which intersects the plane which the triangle lies in is contained within the triangle.
We are able to do this by observing and comparing the signs of a scalar triple product between vectors going from
the line to the points of the triangle & the direction of the line.

References:
Base by Srinivasan Thiagarajan
Plane - OBB by Nicholas Gallagher
AABB-2D by Brockton Roth
*/

#version 400 core // Identifies the version of the shader, this line must be on a separate line from the rest of the shader code
 
layout(location = 0) in vec3 in_position;	// Get in a vec3 for position
layout(location = 1) in vec4 in_color;		// Get in a vec4 for color

out vec4 color; // Our vec4 color variable containing r, g, b, a

uniform mat4 MVP; // Our uniform MVP matrix to modify our position values

void main(void)
{
	color = in_color;	// Pass the color through
	gl_Position = MVP * vec4(in_position, 1.0); //w is 1.0, also notice cast to a vec4
}