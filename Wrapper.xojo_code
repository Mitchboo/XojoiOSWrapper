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
		Function boolToText(extends variable as boolean) As Text
		  return If(variable, "True", "False")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cdbl(Number as Text) As Double
		  return double.FromText(Number)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function chr(c as integer) As Text
		  return Text.FromUnicodeCodepoint(c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearFocus(extends c As iOSControl)
		  declare sub resignFirstResponder lib "Foundation.Framework" selector "resignFirstResponder" (obj_id as Ptr)
		  
		  resignFirstResponder(c.handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decodeBase64(aText as text) As Text
		  'By Jason King
		  'Function decodeBase64(aText as text) As Text
		  declare function initWithBase64EncodedString lib FoundationLib selector "initWithBase64EncodedString:options:" _
		  (obj_id as ptr, str as CFStringRef, options as Integer) as ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  
		  dim mData as ptr = initWithBase64EncodedString(alloc(NSClassFromString("NSData")), aText, 1)
		  
		  const NSUTF8StringEncoding = 4
		  
		  declare function initWithData lib FoundationLib selector "initWithData:encoding:" (obj_id as ptr, data as ptr, encoding as Integer) as CFStringRef
		  Return initWithData(alloc(NSClassFromString("NSString")), mData, NSUTF8StringEncoding)
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function encodeBase64(extends mb as MemoryBlock) As Text
		  'From Phillip Zedalis
		  'Function EncodeBase64(Extends t As Text) As Text
		  Declare Function dataWithBytes Lib "UIKit" Selector "dataWithBytes:length:" (class_id As Ptr, bytes As Ptr, length As UInt32) As Ptr
		  Declare Function base64EncodedStringWithOptions Lib "UIKit" Selector "base64EncodedStringWithOptions:" (class_id As Ptr, options As UInt32) As CFStringRef
		  
		  // Create NSData pointer to be point of reference.
		  Dim data As Ptr
		  data = NSClassFromString("NSData")
		  
		  '// Create global ASCII TextEncoding
		  'Dim te As Xojo.Core.TextEncoding
		  'te = Xojo.Core.TextEncoding.FromIANAName("ISO-8859-1")
		  '
		  '// Convert Text to MemoryBlock
		  'Dim tmb As Xojo.Core.MemoryBlock
		  'tmb = te.ConvertTextToData(t)
		  
		  // Create NSData object using MemoryBlock
		  Dim dataRef as Ptr = dataWithBytes(data, mb.Data, mb.Size)
		  
		  // Create Text object to hold Base64 encoded string.
		  Dim x As Text
		  x = base64EncodedStringWithOptions(dataRef, 0)
		  
		  // Return Base64 encoded string
		  Return x
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncodeBase64(Extends t As Text) As Text
		  'From Phillip Zedalis
		  'Function EncodeBase64(Extends t As Text) As Text
		  Declare Function dataWithBytes Lib "UIKit" Selector "dataWithBytes:length:" (class_id As Ptr, bytes As Ptr, length As UInt32) As Ptr
		  Declare Function base64EncodedStringWithOptions Lib "UIKit" Selector "base64EncodedStringWithOptions:" (class_id As Ptr, options As UInt32) As CFStringRef
		  
		  // Create NSData pointer to be point of reference.
		  Dim data As Ptr
		  data = NSClassFromString("NSData")
		  
		  // Create global ASCII TextEncoding
		  Dim te As Xojo.Core.TextEncoding
		  te = Xojo.Core.TextEncoding.FromIANAName("ISO-8859-1")
		  
		  // Convert Text to MemoryBlock
		  Dim tmb As Xojo.Core.MemoryBlock
		  tmb = te.ConvertTextToData(t)
		  
		  // Create NSData object using MemoryBlock
		  Dim dataRef as Ptr = dataWithBytes(data, tmb.Data, tmb.Size)
		  
		  // Create Text object to hold Base64 encoded string.
		  Dim x As Text
		  x = base64EncodedStringWithOptions(dataRef, 0)
		  
		  // Return Base64 encoded string
		  Return x
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function encodeBase64_2(aText as Text) As Text
		  'By Jason King
		  'Function encodeBase64(aText as Text) As Text
		  declare function dataUsingEncoding lib FoundationLib selector "dataUsingEncoding:" (obj_id as ptr, encoding as Integer) as ptr
		  declare function stringWithString lib FoundationLib selector "stringWithString:" (obj_id as ptr, str as CFStringRef) as ptr
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  
		  const NSUTF8StringEncoding = 4
		  dim str as Ptr = stringWithString(NSClassFromString("NSString"), aText)
		  dim mData as ptr = dataUsingEncoding(str,NSUTF8StringEncoding)
		  
		  declare function base64EncodedStringWithOptions lib FoundationLib selector "base64EncodedStringWithOptions:" _
		  (obj_id as ptr, options as Integer) as CFStringRef
		  
		  Return base64EncodedStringWithOptions(mData,1)
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncodeURLComponent(value as text) As text
		  
		  Declare Function CFURLCreateStringByAddingPercentEscapes lib "Foundation" (allocator as Ptr, origString as CFStringRef , charactersToLeaveUnescaped as CFStringRef , legalURLCharactersToBeEscaped as cfStringRef,encoding as uint32) as CFStringRef
		  
		  return CFURLCreateStringByAddingPercentEscapes(nil, value, nil, nil, &h08000100)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindType(extends au as Auto) As Text
		  'Function FindType(extends au as Auto) As Text
		  dim oTypeInfo as xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(au)
		  
		  return oTypeInfo.FullName
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAppVersion() As Text
		  'Function getAppVersion() As Text
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  declare function mainBundle lib FoundationLib selector "mainBundle" (clsRef as ptr) as ptr
		  declare function objectForInfoDictionaryKey lib FoundationLib selector "objectForInfoDictionaryKey:" _
		  (obj_id as ptr, key as CFStringRef) as CFStringRef
		  
		  Return objectForInfoDictionaryKey(mainBundle(NSClassFromString("NSBundle")), "CFBundleShortVersionString")
		  'End Function
		End Function
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
		Sub goTabPage(idx as integer, doReset as Boolean = False)
		  'This method has been posted in the forum by Antonio Rinaldi.
		  'It allows setting the active tab like if the user had tapped himself on the tab icon, without need for PushTo.
		  'Index is zero based, left to right
		  
		  
		  
		  'Sub goTabPage(idx as integer,doReset as Boolean=False)
		  if idx<0 then Return
		  Declare Function NSClassFromString lib "Foundation"(cls as CFStringRef) as Ptr
		  Declare function sharedApplication_ lib "UIKit" selector "sharedApplication"(cls_ptr as Ptr) as Ptr
		  dim shAppPtr as Ptr=sharedApplication_(NSClassFromString("UIApplication"))
		  
		  Declare function keyWindow_ lib "UIkit" selector "keyWindow"(app_ptr as Ptr) as Ptr
		  dim keyWinPtr as Ptr=keyWindow_(shAppPtr)
		  
		  Declare Function rootWiewController_ lib "UIKit" selector "rootViewController"(winPtr as Ptr) as Ptr
		  dim rootWiewControllerPtr as Ptr=rootWiewController_(keyWinPtr)
		  
		  Declare Function isMemberOfClass_ lib "foundation" selector "isMemberOfClass:"(oPtr as Ptr,cPtr as Ptr) as Boolean
		  dim a as ptr=NSClassFromString("UITabBarController")
		  if isMemberOfClass_(rootWiewControllerPtr,NSClassFromString("UITabBarController")) then
		    Declare sub setSelectedIndex lib "UIKIT" selector "setSelectedIndex:"(tbPtr as Ptr,page as UInteger)
		    setSelectedIndex(rootWiewControllerPtr,idx)
		    
		    if doReset then
		      Declare Function selectedViewController_ lib "UIKIT" selector "selectedViewController"(oPtr as ptr) as Ptr
		      dim navPtr as Ptr=selectedViewController_(rootWiewControllerPtr)
		      Declare Sub popToRoot lib "UIKIT" selector "popToRootViewControllerAnimated:"(oPtr as Ptr,animated as Boolean)
		      popToRoot(navPtr,true)
		    end if
		  end if
		  'End Sub
		End Sub
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
		Function isFirstResponder(extends c As iOSControl) As Boolean
		  declare function isFirstResponder lib "Foundation.Framework" selector "isFirstResponder" (obj_id as Ptr) as boolean
		  
		  Return isFirstResponder(c.handle)
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
		Function LenB(Extends T as Text) As Integer
		  
		  const allowLossy as boolean = True
		  Return TextEncoding.UTF8.ConvertTextToData(T, allowLossy).Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LenB(T as Text) As Integer
		  
		  const allowLossy as boolean = True
		  Return TextEncoding.UTF8.ConvertTextToData(T, allowLossy).Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainScreenScale() As Double
		  //Jim McKay Retina detection
		  
		  'Function MainScreenScale() As Double
		  //declare function NSClassFromString lib "Foundation.Framework" (aClassName as CFStringRef) as Ptr
		  declare function NSClassFromString lib "Foundation" (aClassName as CFStringRef) as Ptr
		  soft declare function scale lib "UIKit" selector "scale" (classRef as Ptr) as single
		  soft declare function mainScreen lib "UIKit" selector "mainScreen" (classRef as Ptr) as ptr
		  
		  
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
		Function MD5(extends t as Text) As Text
		  'Antonio Rinaldi  2/14/2015
		  'https://forum.xojo.com/20012-md5-on-text/0#p167800
		  
		  'Function MD5(extends t as Text) As Text
		  dim a As MemoryBlock = TextEncoding.UTF8.ConvertTextToData(t)
		  dim b As MemoryBlock = Xojo.Crypto.MD5(a)
		  dim v() as Text
		  dim n as UInteger=b.Size-1
		  for i as UInteger=0 to n
		    v.Append b.UInt8Value(i).ToHex(2)
		  next
		  return text.Join(v,"")
		  'End Function
		End Function
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
		Sub SaveToCameraRoll(extends img as iOSImage)
		  'Jason King
		  'Just saw this conversation - its entirely possible with declares. Just pop this short function into a module and call it like "img.SaveToCameraRoll"
		  
		  'Sub SaveToCameraRoll(extends img as iOSImage)
		  declare sub UIImageWriteToSavedPhotosAlbum lib "UIKit" (img as ptr, target as ptr, sel as ptr, info as ptr)
		  UIImageWriteToSavedPhotosAlbum(img.Handle,nil,nil,nil)
		  'End Sub
		End Sub
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
		  declare sub becomeFirstResponder lib "Foundation.Framework" selector "becomeFirstResponder" (obj_id as Ptr)
		  
		  becomeFirstResponder(c.handle)
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
		  
		  // https://developer.apple.com/library/mac/documentation/UIKit/Reference/Foundation/Classes/NSURL_Class/#//apple_ref/occ/clm/NSURL/URLWithString:
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
		Function Str(Value as Auto) As Text
		  Dim info As Xojo.Introspection.TypeInfo
		  info = Xojo.Introspection.GetType(Value)
		  system.debuglog info.Name
		  
		  if info.Name = "Color" then
		    dim c as color = Value
		    return "&c"+c.Red.toHex(2) + _
		    c.Green.toHex(2) + _
		    c.Blue.toHex(2) + _
		    c.Alpha.toHex(2)
		  elseif info.name = "Int32" or info.name = "Int64" or info.name = "UInt32" or info.name = "Int64" then
		    dim v as Int64 = value
		    Return v.ToText
		  elseif info.name = "Single" or info.name = "Double"then
		    dim v as double = value
		    Return v.ToText
		  elseif info.name = "Date" then
		    dim d as date = value
		    Return d.Totext
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StripAccents(T as Text) As Text
		  //From Eli Ott, in https://forum.xojo.com/29028-textencodings-to-remove-accented-characters
		  Declare Function dataUsingEncoding Lib "Foundation" Selector "dataUsingEncoding:allowLossyConversion:" _
		  (NSString As CFStringRef, NSStringEncoding As UInteger, allowLossyConversion As Boolean) As Ptr
		  Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		  Declare Function alloc Lib "Foundation" Selector "alloc" (NSClass As Ptr) As Ptr
		  Declare Function initWithData Lib "Foundation" Selector "initWithData:encoding:" _
		  (NSClass As Ptr, NSData As Ptr, NSStringEncoding As UInteger) As CFStringRef
		  
		  Const NSASCIIStringEncoding = 1
		  
		  //Dim t As Text = "áéíóúàèìòùäëïöüãõÁÉÍÓÚÀÈÌÒÙÄËÏÖÜÃÕç"
		  
		  Dim data As Ptr = dataUsingEncoding(t, NSASCIIStringEncoding, True)
		  Dim result As CFStringRef = initWithData(alloc(NSClassFromString("NSString")), data, NSASCIIStringEncoding)
		  
		  Return Result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(extends a as Auto) As Text
		  'This method has been created by Brock Nash
		  'Function TextValue(extends a as Auto) As text
		  Dim info As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(a)
		  
		  #if TargetDesktop or TargetWeb then
		    if info.Name = "string" then
		      return CType(a, string).totext
		    elseif info.name = "variant" then
		      dim v as Variant = a
		      return v.TextValue
		    end
		  #endif
		  Select Case info.Name
		  Case "Integer"
		    return CType(a, Integer).totext
		  Case "Int8"
		    return CType(a, Int8).totext
		  Case "UInt8"
		    return CType(a, UInt8).totext
		  Case "UInt16"
		    return CType(a, UInt16).totext
		  Case "UInt32"
		    return CType(a, UInt32).totext
		  Case "UInt64"
		    return CType(a, UInt64).totext
		  Case "Short"
		    return CType(a, Short).totext
		  Case "Byte"
		    return CType(a, Byte).totext
		  Case "Int32"
		    return CType(a, Int32).totext
		  Case "Int64"
		    return CType(a, Int64).totext
		  Case "text"
		    dim t as text = a
		    return t
		  Case "Double"
		    return CType(a, Double).totext
		  Else
		    return ""
		  end
		  
		  'End Function
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(Extends Img as iOSImage) As iOSImage
		  dim pic as new iOSBitmap(img.width, img.height, 1, False)
		  
		  for x as integer = 0 to img.width
		    for y as integer = 0 to img.height
		      if img.Pixel(x,y) <> &c00000000 then
		        pic.Graphics.AntiAlias = False
		        pic.graphics.LineColor = img.pixel(x,y)
		        pic.Graphics.LineWidth =  1
		        pic.Graphics.DrawLine(x,y,x+1,y)
		      end if
		    next
		  next
		  
		  return pic.Image
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

	#tag Note, Name = Present view modal
		
		Jason King is not verified 5 hours ago 2015/2/6
		I don't know if this will help you any, but you can present the new view modally and it won't have a toolbar at all. You would then have to add your own cancel and done buttons (since it doesn't seem possible to use the Navigationbar for modal views) but it would eliminate the back arrow problem. To present a view modally:
		
		declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		//newView is an instance of iOSView which is the new view you want to present modally, self is the iOSView you want to cover up (what you would normally call self.PushTo() from to display newView
		PresentViewController_(self.ViewControllerHandle, newView.ViewControllerHandle, True, nil)
		To dismiss that view:
		
		declare sub dismissModalViewController lib UIKitLib selector "dismissViewControllerAnimated:completion:" _
		(obj_id as ptr, animated as Boolean, completion as ptr)
		//self is the parent iOSView, not the view you presented modally
		//you may want to keep a reference to the parent iOSView in the modally presented view so that you can dismiss the modal view from within itself (i.e. by a button)
		dismissModalViewController(self.ViewControllerHandle, True, Nil)
		
	#tag EndNote

	#tag Note, Name = Untitled
		
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &u0D+&u0A
			  
			End Get
		#tag EndGetter
		EndOfLine As Text
	#tag EndComputedProperty


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
			Name="EndOfLine"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
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
