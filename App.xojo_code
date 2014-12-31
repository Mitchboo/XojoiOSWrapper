#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Method, Flags = &h0
		Sub HideStatusBar(mView as iOSView)
		  ' By Jason King
		  'Sub HideStatusBar(mView as iOSView)
		  declare function object_getClass lib "/usr/lib/libobjc.A.dylib" (cls As Ptr) As Ptr
		  declare function NSSelectorFromString lib FoundationLib (aSelectorName as CFStringRef) as Ptr
		  declare function class_addMethod lib "/usr/lib/libobjc.A.dylib" (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  
		  dim viewControllerClass As Ptr = object_getClass(mView.ViewControllerHandle)
		  if not class_addMethod(viewControllerClass, NSSelectorFromString("prefersStatusBarHidden"), _
		  AddressOf impl_prefersStatusBarHidden, "b@:") then break
		  'End Sub
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_prefersStatusBarHidden(pid as ptr, sel as ptr) As Boolean
		  'Works with hideStatusBar by Jason King
		  'Private Shared Function impl_prefersStatusBarHidden(pid as ptr, sel as ptr) As Boolean
		  Return True
		  'End Function
		End Function
	#tag EndMethod


	#tag Note, Name = How to use HideStatusBar
		This method has been created by Jason King.
		
		To use HideStatusBar, add in the Open event of a view :
		HideStatusBar(self)
		
		As of now, it does remove the status bar for the whole application, but a method to reinstate it is not available.
	#tag EndNote


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
