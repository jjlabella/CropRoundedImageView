# CropRoundedImageView
Swift (iOS) - Sometimes you need to crop to center or make a round UIImageView. This library will help you to do it.

In this example we are going to create a @IBDesignable and we will use @IBInspectable variables to setup our new component.

##Preview
![](https://github.com/jjlabella/CropRoundedImageView/blob/master/CropRoundedImageView/PreviewFinal.png)

##Installation
The only thing you need to do is just drag and drop the file "**CropRoundedImageView.swift**" to you project.

##How to use it
First of all set the custom class to "CropRoundedImageView" for each UIImageView you want to rounded or center crop.

![](https://github.com/jjlabella/CropRoundedImageView/blob/master/CropRoundedImageView/CustomClass.png)

You have two options:

1. Setup the component in Xcode

If you are creating your component in compile time, and the UIImageView extis, you can use this controls in your Xcode to setup your UIImageView

![](https://github.com/jjlabella/CropRoundedImageView/blob/master/CropRoundedImageView/Options.png)

2. Do it in your code

On the other hand, if your UIImageView is not created when you press "Play", you can setup your control usign the public function inside the class.

- makeRound() -> To round your UIImageView
- cropImage() -> To center crop your UIImageView
- load() ->  -> To round and crop your UIImageView

##Support
Any questions, please fell free to send me your comments: jjlabella@gmail.com








