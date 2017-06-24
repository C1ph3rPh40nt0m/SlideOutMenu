# SlideOutMenu
shows a left slide out menu
# Version
1.0.0
# Description
it is simple like a facebook menu comes from the left side of the screen to the right. Not only is it simple, but also it comes with gesture to open & close the menu. also, it provides easy way to do your own customizations by using attribute inspector such as :
1- set shadow for the main controller.
  #set shadow color.
  #set shadow opacity.
  #set shadow radius.
2- link main & menu controller by define their Storyboard IDs.
3- shift between menu in screen by percentage or pixels. 
4- set your menu image.

# configurations & how it works
First import the class to your work path.
- Create in your storyboard
  #Container ViewController => which will be the parent.
  #Main ViewController => which will show the main content of your controller.
  #Menu ViewController => which will show your menu comes from the left side screen to the right.
- Set the storyboard IDs :
  #type main as a storyboard ID to the main view controller.
  #type menu as a storyboard ID to the menu view controller.
- Finally :
  #import an image named menu to the Assets folder so it can be the image of your menu bar button.
