#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Note, Name = Change navigationBar color
		
		https://forum.xojo.com/18202-navigationbar-color
		
		Richard Berglund 5 hours ago Beta Testers
		Hi,
		
		With the help from Jim Mckay. Changing the color of the NavigationBar.
		
		Private Function UIColor(c as Color) As Ptr
		// returns a Ptr to a new Uicolor Created from a Xojo Color
		declare function colorFromRGBA lib UIKit selector "colorWithRed:green:blue:alpha:" (id as Ptr, red as Single, green as Single, blue as Single, alpha as Single) as Ptr
		dim r as single = c.red/255
		dim g as single = c.Green/255
		dim b as single = c.Blue/255
		dim a as single = (255 - c.Alpha) / 255
		
		return colorFromRGBA(NSClassFromString ("UIColor"), r, g, b, a)
		End Function
		
		declare function NSClassFromString      lib "Foundation" (classname as CFStringRef) as ptr
		declare function keyWindow              lib "UIKit" selector "keyWindow"  (obj_ref as ptr) as ptr
		declare function sharedApplication      lib "UIKit" selector "sharedApplication"  (obj_ref as ptr) as ptr
		declare function rootViewController      lib "UIKit" selector "rootViewController"  (obj_ref as ptr) as ptr
		declare function navigationBar          lib "UIKit" selector "navigationBar"  (obj_ref as ptr) as ptr
		
		dim sApp as ptr=sharedApplication(NSClassFromString("UIApplication"))
		dim currentWindow as ptr=keyWindow(sApp)
		dim navController as ptr=rootViewController(currentWindow)
		dim navBar as ptr= navigationBar(navController)
		
		Declare Sub setBarTintColor lib UIKit selector "setBarTintColor:" (id as ptr, UIColor as Ptr)
		setBarTintColor navBar, UIColor(&cFF0000)
		
		declare Sub setTintColor lib UIKit selector "setTintColor:" (id as ptr, UIColor as Ptr)
		setTintColor navBar, UIColor(&cFF7700)
		
		declare sub setTranslucent lib UIKit selector "setTranslucent:" (id as ptr)
		setTranslucent navBar
		You can set it to translucent or solid by excluding setTranslucent.
		
		For changing the text color for the top text. I'm still trying to figure out.
		
		let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		self.navigationController.navigationBar.titleTextAttributes = titleDict
		
		or
		[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	#tag EndNote


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
