#tag Module
Protected Module Wrapper
	#tag Method, Flags = &h0
		Function asc(s as text) As Integer
		  
		  
		  if s.Length > 1 then
		    s = s.Left(1)
		  end if
		  
		  For Each codePoint As UInt32 In s.Codepoints
		    return codepoint
		  Next
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Backdrop(extends b As iOSButton, assigns backdrop as iOSImage)
		  'This method was posted by Jim McKay in the https://forum.xojo.com/18184-button-and-view-colours-ios/last thread
		  'on 12/12/2014
		  
		  declare sub setBackgroundImage lib "UIKit" selector "setBackgroundImage:forState:" (obj as ptr, value as ptr, state as integer)
		  setBackgroundImage(b.Handle,backdrop.Handle,0)
		  
		  //For use : iOSButton.Backdrop = Pic
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function chr(c as integer) As Text
		  return Text.FromUnicodeCodepoint(c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearFocus(extends c As iOSControl)
		  declare sub resignFirstResponder lib "Foundation.Framework" selector "resignFirstResponder" (obj_id as Uint32)
		  
		  resignFirstResponder(UInt32(c.handle))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getGUID() As Text
		  
		  declare function NSClassFromString lib "Foundation" (clsName as cfstringref) as ptr
		  dim UIDevicePtr as ptr = NSClassFromString("UIDevice")
		  declare function currentDevice lib "UIKit" selector "currentDevice" (clsRef as ptr) as ptr
		  dim currentDevicePtr as ptr = currentDevice(UIDevicePtr)
		  
		  declare function identifierForVendor lib "UIKit" selector "identifierForVendor" (obj_id as ptr) as ptr
		  dim NSUUIDPtr as ptr = identifierForVendor(currentDevicePtr)
		  
		  declare function UUIDString lib "Foundation" selector "UUIDString" (obj_id as ptr) as cfstringref
		  dim GUID as Text = UUIDString(NSUUIDPtr)
		  
		  return GUID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub hideTabBar(v as iOSView, slf as iOSView)
		  ' This method was posted by Paul Lefebvre at https://forum.xojo.com/18176-controlling-tab-bar-visibility/last
		  ' on 12/12/2014
		  
		  'To hide the tabbar for a view, call as such :
		  'Dim v As New View1
		  'hideTabBar(v, Self)
		  
		  // @property(nonatomic) BOOL hidesBottomBarWhenPushed
		  
		  Declare Sub setHidesBottomBarWhenPushed Lib "UIKit" _
		  Selector "setHidesBottomBarWhenPushed:" (id As Ptr, value As Boolean)
		  
		  setHidesBottomBarWhenPushed(v.Handle, True)
		  
		  Slf.PushTo(v)
		  
		  // To reinstate the tab bar, close the pushed view.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instr(Texte as Text, Cherche as Text) As Integer
		  Return Texte.IndexOf(Cherche)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Left(T as text, count as integer) As Text
		  if count > 0 then
		    if count > t.length then
		      count = t.length
		    end if
		    return t.Left(count)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function len(t as Text) As Integer
		  return t.length
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainScreenScale() As Double
		  //Jim McKay Retina detection
		  
		  'Function MainScreenScale() As Double
		  //declare function NSClassFromString lib "Foundation.Framework" (aClassName as CFStringRef) as Ptr
		  declare function NSClassFromString lib "Foundation" (aClassName as CFStringRef) as Ptr
		  soft declare function scale lib "Cocoa" selector "scale" (classRef as Ptr) as single
		  soft declare function mainScreen lib "Cocoa" selector "mainScreen" (classRef as Ptr) as ptr
		  
		  
		  return scale(mainScreen(NSClassFromString("UIScreen")))
		  
		  
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MaxWidth()
		  declare sub setAdjustsFontSizeToFitWidth lib "Foundation" selector "setAdjustsFontSizeToFitWidth:" (obj as ptr,value as Boolean)
		  'setAdjustsFontSizeToFitWidth(Label1.Handle,true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mid(T as Text, start as Integer, lengt as integer) As Text
		  if lengt > 0 then
		    if lengt > T.Length then lengt = t.Length
		    return T.Mid(start-1, lengt)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Msgbox(s as text)
		  dim m as new iOSMessageBox
		  
		  dim buttons() as text
		  buttons.Append("OK")
		  m.Buttons = buttons
		  m.Message = s
		  m.Show
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib Foundation (aClassName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function NthField(txt as Text, delimiter as Text, index as integer) As Text
		  Dim parts() as Text = txt.split(delimiter)
		  Return parts(index-1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pixel(extends g as iOSGraphics, x as integer, y as integer) As Color
		  'Jason King
		  'It works on both iOSGraphics and iOSImage. Just call img.Pixel(x,y) or g.Pixel(x,y) to get the color at the specified position. Enjoy!
		  
		  
		  const UIKitLib =  "UIKit.framework"
		  const CoreGraphicsLib = "CoreGraphics.framework"
		  const FoundationLib = "Foundation.framework"
		  
		  declare function CGBitmapContextCreateImage lib CoreGraphicsLib (context as ptr) as ptr
		  dim cgimageref as ptr = CGBitmapContextCreateImage(g.Handle)
		  
		  declare function imageWithCGImage lib UIKitLib selector "imageWithCGImage:" (clsRef as ptr, img as ptr) as ptr
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  dim newUIImage as ptr = imageWithCGImage(NSClassFromString("UIImage"), cgimageref)
		  
		  Return iOSImage.FromHandle(newUIImage).Pixel(x,y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pixel(extends img as iosImage, x as integer, y as integer) As Color
		  'Jason King
		  'It works on both iOSGraphics and iOSImage. Just call img.Pixel(x,y) or g.Pixel(x,y) to get the color at the specified position. Enjoy!
		  
		  const CoreGraphicsLib = "CoreGraphics.framework"
		  const UIKitLib = "UIKit.framework"
		  const CoreFoundationLib = "CoreFoundation.framework"
		  
		  
		  if x>img.Width or y>img.Height or x<0 or y<0 then
		    dim e as new OutOfBoundsException
		    e.Reason = "The pixel location must be within the bounds of the picture"
		    Raise e
		  end if
		  
		  declare function CGImage lib UIKitLib selector "CGImage" (obj_id as ptr) as ptr
		  dim CGImageRef as ptr = CGImage(img.Handle)
		  
		  declare function CGImageGetDataProvider lib CoreGraphicsLib (cgimage as ptr) as ptr
		  dim dataProvider as ptr = CGImageGetDataProvider(CGImageRef)
		  
		  declare function CGDataProviderCopyData lib CoreGraphicsLib (provider as ptr) as ptr
		  dim pixelData as ptr = CGDataProviderCopyData(dataProvider)
		  
		  declare function CFDataGetBytePtr lib CoreFoundationLib (dataref as ptr) as Ptr
		  dim dataMB as xojo.core.MemoryBlock = new xojo.Core.MemoryBlock(CFDataGetBytePtr(pixelData))
		  
		  dim numberOfComponents as Integer = 4 //PNG is RGBA
		  dim startPoint as Integer = ((img.Width*y)+x)*numberOfComponents
		  
		  dim r, g, b, a as UInt8
		  b = dataMB.UInt8Value(startPoint)
		  g = dataMB.UInt8Value(startPoint+1)
		  r = dataMB.UInt8Value(startPoint+2)
		  a = 255-dataMB.UInt8Value(startPoint+3)
		  
		  declare sub CFRelease lib CoreFoundationLib (obj_id as ptr)
		  CFRelease(pixelData)
		  
		  Return Color.RGBA(r,g,b,a)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function redColor() As Ptr
		  'From
		  'Private Function RedColor() As Ptr
		  // Returns a red NSColor
		  
		  declare function redColor lib UIKit selector "redColor" (id as Ptr) as Ptr
		  return redColor(NSClassFromString ("UIColor"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Right(T as text, count as integer) As Text
		  if count > 0 then
		    if count > t.length then
		      count = t.length
		    end if
		    return t.Right(count)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setBackgroundRoundedRectangle(extends b As iOSButton, back As color, border as color, radius as double)
		  'This method was posted by Jim McKay in the https://forum.xojo.com/18184-button-and-view-colours-ios/last thread
		  'on 12/12/2014
		  
		  declare sub setBackgroundImage lib "UIKit" selector "setBackgroundImage:forState:" (obj as ptr, value as ptr, state as integer)
		  
		  radius=min(radius,min(b.Width,b.Height)/2-.01)
		  
		  dim pth As new iOSPath
		  pth.AddRoundRect(0,0,b.width,b.height,radius,radius)
		  
		  dim p as new iOSBitmap(b.Width,b.Height,1)
		  p.Graphics.LineColor=border
		  p.Graphics.FillColor=back
		  p.Graphics.LineWidth=1
		  p.Graphics.FillPath(pth)
		  p.Graphics.DrawPath(pth)
		  
		  dim i As iOSImage=p.Image
		  setBackgroundImage(b.Handle,i.Handle,0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus(extends c As iOSControl)
		  declare sub becomeFirstResponder lib "Foundation.Framework" selector "becomeFirstResponder" (obj_id as Uint32)
		  
		  becomeFirstResponder(UInt32(c.handle))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSeparatorColor(id as ptr, UIColor as Ptr)
		  ' By Richard Berglund
		  
		  'Private Sub setSeparatorColor(id as ptr, UIColor as Ptr)
		  declare Sub setSeparatorColor lib UIKit selector "setSeparatorColor:" (id as ptr, UIColor as Ptr)
		  setSeparatorColor id, UIColor
		  
		  'End Sub
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSeparatorStyle(myIOSTable as iOSTable, Style as integer)
		  ' From Antonio Rinaldi
		  ' Style = 0 no line. 1 = ndefault
		  declare sub setSeparatorStyle lib "UIKit" selector "setSeparatorStyle:"(o as ptr,mode as integer)
		  'setSeparatorStyle(myIOSTable.handle,0)
		  setSeparatorStyle(myIOSTable.handle,Style)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowURL(url As Text) As Boolean
		  // NSString* launchUrl = @"http://www.xojo.com/";
		  // [[UIApplication sharedApplication] openURL:[NSURL URLWithString: launchUrl]];
		  
		  Declare Function NSClassFromString Lib "Foundation" (name As CFStringRef) As Ptr
		  Declare Function sharedApplication Lib "UIKit" Selector "sharedApplication" (obj As Ptr) As Ptr
		  Dim sharedApp As Ptr = sharedApplication(NSClassFromString("UIApplication"))
		  
		  // https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/#//apple_ref/occ/clm/NSURL/URLWithString:
		  Declare Function URLWithString Lib "Foundation" Selector "URLWithString:" ( id As Ptr, URLString As CFStringRef ) As Ptr
		  Dim nsURL As Ptr = URLWithString(NSClassFromString("NSURL"), url)
		  
		  // https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIApplication_Class/index.html#//apple_ref/occ/instm/UIApplication/openURL:
		  Declare Function openURL Lib "UIKit" Selector "openURL:" (id As Ptr, nsurl As Ptr) As Boolean
		  Return openURL(sharedApp, nsURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function split(s as text, delimiter as text) As text()
		  return s.split(delimiter)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UIColor(c as Color) As Ptr
		  // returns a Ptr to a new Uicolor Created from a Xojo Color
		  declare function colorFromRGBA lib UIKit selector "colorWithRed:green:blue:alpha:" (id as Ptr, red as Single, green as Single, blue as Single, alpha as Single) as Ptr
		  dim r as single = c.red/255
		  dim g as single = c.Green/255
		  dim b as single = c.Blue/255
		  dim a as single = (255 - c.Alpha) / 255
		  
		  return colorFromRGBA(NSClassFromString ("UIColor"), r, g, b, a)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Val(T as Text) As Double
		  Return Double.FromText(T)
		End Function
	#tag EndMethod


	#tag Note, Name = Posts in the forum and tips
		
		12/12/2014
		
		jim mckay  1 minute ago Beta Testers, Xojo Pro
		Here's a method to add a round rect to an iOSButton
		
		Sub setColor(extends b As iOSButton,  back As color, border as color, radius as double)
		declare sub setBackgroundImage lib "UIKit" selector "setBackgroundImage:forState:" (obj as ptr, value as ptr, state as integer)
		
		radius=min(radius,min(b.Width,b.Height)/2-.01)
		
		dim pth As new iOSPath
		pth.AddRoundRect(0,0,b.width,b.height,radius,radius)
		
		dim p as new iOSBitmap(b.Width,b.Height,1)
		p.Graphics.LineColor=border
		p.Graphics.FillColor=back
		p.Graphics.LineWidth=1
		p.Graphics.FillPath(pth)
		p.Graphics.DrawPath(pth)
		
		dim i As iOSImage=p.Image
		setBackgroundImage(b.Handle,i.Handle,0)
		End Sub
		
		-----------------------------------
		
		https://forum.xojo.com/18176-controlling-tab-bar-visibility/0#p151660
		
		Paul Lefebvre 11 hours ago Xojo Inc United States (Maine)
		Seems like this might work:
		
		// @property(nonatomic) BOOL hidesBottomBarWhenPushed
		
		Dim v As New View3
		
		Declare Sub setHidesBottomBarWhenPushed Lib "UIKit" _
		Selector "setHidesBottomBarWhenPushed:" (id As Ptr, value As Boolean)
		
		setHidesBottomBarWhenPushed(v.Handle, True)
		
		Self.PushTo(v)
		
		---
		
		To reinstate the tab, use self.close.
		
		---------
	#tag EndNote


	#tag Constant, Name = Foundation, Type = Text, Dynamic = False, Default = \"foundation.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FoundationLib, Type = Text, Dynamic = False, Default = \"foundation.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIKit, Type = Text, Dynamic = False, Default = \"UIKit", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WrFoundationLib, Type = Text, Dynamic = False, Default = \"foundation.framework", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
