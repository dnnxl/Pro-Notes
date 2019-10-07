# Processing Notebook
This repository is to save and keep tracking of my processing examples. Here are some examples made in simulation of natural systems class, and also creative work made it by me. 

## Installation
This is how we install the github examples in this repository. This are the following steps:
* Click the green button 'Clone or download' in the right side of the window. 
* Copy the link https://github.com/dnnxl/Processing-Notebook.git or click download in the button.
* And download the examples packages using the link.

## Requirements
* Processing software version 3.0.0 or greater
* Processing libraries needed: PeasyCam, ControlP5 and GifMaker(not necessarily).

## Examples
Here are some examples of processing small projects. Also some homeworks and practices made it in the simulation of natural systems.

### 1. Agent Circle
- First create a class agent, then a system of agents(is represented as an arraylist of agents) of 10000 agents. 
- In a random position in x and y dependent on the width and height of the window. 
- Each agent has a initial velocity in a random 2D vector, with a coefficient of 0.01. 
- <kbd>SPACE</kbd> To start the simulation it has to touch the space in the keyboard and you will see the simulation start. 
- It applies force of 0.09 to each draw method called, it is divided in four cuadrant.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Agents%20circle.gif)

### 2. Agents floating
- First create a class agent, then a system of agents(is represented as an arraylist of agents) of 10000 agents. 
- In a random position in x and y dependent on the width and height of the window. 
- Each agent has a initial velocity in a random 2D vector, with a coefficient of 0.01. 
- <kbd>SPACE</kbd> To start the simulation it has to touch the space in the keyboard and you will see the simulation start. 
- It applies force of 0.09 to each draw method called, it is divided in four cuadrant it is different from Agent Circle.

![alt-text](https://github.com/dnnxl/Processing-Notes/blob/master/Images/Agents%20floating.gif)

### 3. Angular movement 2D
- First create a class agent, then a system of agents(is represented as an arraylist of agents) of 100 agents. 
- Each agent has a initial velocity in a random 2D vector, with a coefficient of 1 and also has a gravity of 0.01 in the axis y. 
- Each agent is moved by the mouse provoking an angular movement.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Angular%20movement%202D.gif)

### 4. Blur
- Using loadPixels and updatePixels.
- Apply the noise function to update the color of each pixels in the window.

![alt-text](https://github.com/dnnxl/Processing-Notes/blob/master/Images/Blur.gif)

### 5. Bound bound ball
- First create a class Ball, then a system of Ball(is represented as an arraylist of balls).
- Each ball is created by the mouse pressed taking the x and y of the mouse location.

![alt-text](https://github.com/dnnxl/Processing-Notes/blob/master/Images/Bound%20bound%20ball.gif)

### 6. Broken TV
- Using loadPixels and updatePixels.
- Update the color of each pixels in the window using the random function.

![alt-text](https://github.com/dnnxl/Processing-Notes/blob/master/Images/Broken%20TV.gif)

### 7. Cannon agents
- Create a class agent and cannon.
- The cannon is moved by the mouse X and Y position.
- The shooting method is controlled by the click of the mouse.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Cannon%20agents.gif)

### 8. Circle mass
- Create a class of agent and also for the system of agents. Each agent has a mass depending on his size. Use gravity force to drag them.
- <kbd>W</kbd> Apply force to up. 
- <kbd>A</kbd> Apply force to left. 
- <kbd>S</kbd> Apply force to down. 
- <kbd>D</kbd> Apply force to right. 

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Circle%20mass.gif)

### 9. Circle system run
- Class agent and system.
- Each draw method create a new circle in the system along the old circle created.

![alt-text](https://github.com/dnnxl/Processing-Notes/blob/master/Images/Circle%20system%20run.gif)

### 10. Circle system run 3D
- Class sphere and system.
- Each draw method create a new sphere in the system along the old sphere created.

![alt-text](https://github.com/dnnxl/Processing-Notes/blob/master/Images/Circle%20run%20system%203D.gif)

### 11. Random walker
- System of agents and a class agent.
- While the mouse is pressed it creates a new RandomWalker.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Random%20walker.gif)

### 12. Cube agent	
- Class agent and agentSystem. 3D simulation. 
- The agents is contained in a big box. Has a gravity force. 
- There is a total of eight cuadrant, which each cuadrant applies a force of 0.12.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Cube%20agent.gif)

### 13. Drag Agents	
- Class agent and system of agents.
- Using the drag force, simulating the water and the air space.
- Each agent is created by the mouse pressed.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Drag%20Agents.gif)

### 14. Escape agents cube
- A box with agents inside, applies a force in the following directions and the agents get oit of the box.
- <kbd>W</kbd> Apply force to up. 
- <kbd>A</kbd> Apply force to left. 
- <kbd>S</kbd> Apply force to down. 
- <kbd>D</kbd> Apply force to right. 

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Escape%20agents%20cube.gif)

### 15. Floaking agents
- Classes agent, flowfield and spring.
- Each flowfield show the path where the agents show move and also apply a vector force.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Floaking%20agents.gif)

### 16. Flow fields agents
- Classes agent, flowfield and spring.
- Each flowfield show the path where the agents show move and also apply a vector force.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Flow%20fields%20agents.gif)

### 17. Force of gravity
- Class agent and system of agents.
- Using attract and repeler force to each each, there is two agent with this kind of force, represented by white.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Force%20of%20gravity.gif)

### 18. Friction circle systems
- Class agent and system of agents.
- Using friction force.
- <kbd>W</kbd> Apply force to up. 
- <kbd>A</kbd> Apply force to left. 
- <kbd>S</kbd> Apply force to down. 
- <kbd>D</kbd> Apply force to right. 

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Friction%20circle%20system.gif)


### 19. Gaussian colorful circles
- Class circle and system of circles.
- The size of the circle is generate by the random Gayssian.
- Each circle is created by the event of a mouse pressed.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Gaussian%20colorful%20circles.gif)

### 20. Gravity force 3D
- Class agent and system of agents in 3D.
- Using attract and repeler force to each each, there is two agent with this kind of force, represented by white.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Gravity%20force.gif)

### 21. Line ball spring
- Class agent and spring.
- Using spring force.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Line%20ball%20spring.gif)

### 22. Map graphic
- Creating a graphic using noise function.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Map%20graphic.gif)

### 23. Mountain terrain
- Generating terrain using the triangle strip and noise function.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Mountain%20terrain.gif)

### 24. Mouse acceleration
- Class agent and system.
- Total of 1000 agents.
- All the agents chase the mouse position.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Mouse%20acceleration.gif)

### 25. Random No Fill ball
- Class agent and system of agents.
- Generate random agents using gaussian function.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Random%20No%20Fill%20ball.gif)

### 26. Random Colorful square
- Generate colorful square in random positions.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Random%20colorful%20square.gif)

### 27. Rectangle bounds paint
- Rectangule bounds against the borders of the window.
- Class Agent.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Rectangle%20bounds%20paint.gif)

### 28. Rectangle bounds
- Rectangule bounds against the borders of the window.
- Class Agent.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Rectangle%20bounds.gif)

### 29. Route agents
- Draw a route for the agents to follow.
- Each agent follow the behind agent.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Route%20agents.gif)

### 30. Square of contrast
- Create a background using pixels and noise function.

![alt-text](https://github.com/dnnxl/Processing-Notebook/blob/master/Images/Square%20of%20contrast.gif)


## Author
Danny Xie Li
