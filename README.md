# SlideOutMenu
shows a left slide out menu
# Version
1.0.0
# Description
it is simple like a facebook menu comes from the left side of the screen to the right. Not only is it simple, but also it comes with gesture to open & close the menu. also, it provides easy way to do your own customizations by using attribute inspector such as :
1- set shadow for the main controller.
  -set shadow color.
  -set shadow opacity.
  -set shadow radius.
2- link main & menu controller by define their Storyboard IDs.
3- shift between menu in screen by percentage or pixels. 
4- set your menu image.

# configurations & how it works
First import the class to your work path.
- Create in your storyboard
  -Container ViewController => which will be the parent.
  -Main ViewController => which will show the main content of your controller.
  -Menu ViewController => which will show your menu comes from the left side screen to the right.
- Set the storyboard IDs :
  -type main as a storyboard ID to the main view controller.
  -type menu as a storyboard ID to the menu view controller.
- Finally :
  -import an image named menu to the Assets folder so it can be the image of your menu bar button.
  
 # Example
![alt text](https://github.com/Marshal89/SlideOutMenu/blob/master/exampleSlideOut.gif?raw=true)

# Setting (change default value from container attribute inspector)
![alt text](https://github.com/Marshal89/SlideOutMenu/blob/master/Settings%20Example.png?raw=true)
-Enable shadow [ on, off] : default is on
-Shadow Color : default is black
-Shadow opacity [between 0.0 to 1] : default is 1
-Shadow radius : default is 2
-mainID main ViewController storyboard ID : default main
-menuID menu ViewController storyboard ID : default menu
-Shift menu options :
  -shift menu by percentage [ on, off] : default is off
  -shift value : default 300px
  when you set it to on thats mean menu is going to be showen on the screen by shift value percentage
  example if you set percentage to on & the shift value to 90 when the menu comes it will cover 90% of
  the screen from the left to the right.
  if yo set percentage to off & the shift value to 270 it will cover 270px from the screen.
  " note don't type either % or px after the shift value percentage option will determine"
