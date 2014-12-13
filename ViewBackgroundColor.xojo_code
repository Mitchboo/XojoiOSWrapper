#tag IOSView
Begin iosView ViewBackgroundColor
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTextArea TextArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextArea1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   TextArea1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   TextArea1, 3, <Parent>, 3, False, +1.00, 1, 1, 76, 
      AutoLayout      =   TextArea1, 8, , 0, False, +1.00, 1, 1, 283, 
      Editable        =   True
      Height          =   283.0
      KeyboardType    =   "0"
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "This view where the background color has been changed is based upon code from Stéphane Pinel, posted by Richard Berglund in the forum.\n\nSee the Open event of this view.\n"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   76
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSButton Button1
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 82, 
      AutoLayout      =   Button1, 1, <Parent>, 1, False, +1.00, 1, 1, 7, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button1, 4, TextArea1, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      Caption         =   "< Back"
      Enabled         =   True
      Height          =   30.0
      Left            =   7.0
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &cFF800000
      TextFont        =   "Custom	Helvetica	Helvetica-Bold"
      TextSize        =   18
      Top             =   38.0
      Visible         =   True
      Width           =   82.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  ' ObjC Declare to get a ref to a class by its name
		  Declare Function objc_getClass lib "/usr/lib/libobjc.dylib" (aClassName As CString) as Ptr
		  ' Here is the corresponding Xojo call
		  dim theUIColorClassRef As Ptr =  objc_getClass("UIColor")
		  
		  ' UIKit Declare to create a color object
		  Declare Function decl_GetColorWithRGBA lib "UIKit" selector "colorWithRed:green:blue:alpha:" (UIColorClassRef As Ptr, red As Single, green As Single, blue As Single, alpha As Single) As Ptr
		  ' Here is the corresponding Xojo call, where we create a flashy green color
		  dim myUIColorObject As ptr = decl_GetColorWithRGBA(theUIColorClassRef, (33.0/255.0), (209.0/255.0), (57.0/255.0), 1.0)
		  
		  ' UIKit Declare to get a reference to a View from its ViewController
		  Declare Function decl_GetView lib "UIKit" selector "view" (aUIViewController As Ptr) As Ptr
		  ' Here is the corresponding Xojo call (View.Self returns a ViewController)
		  dim myViewPtr As Ptr = decl_GetView(self.Handle)
		  
		  ' UIKit Declare to set the backgound color of a View
		  Declare Sub decl_SetBackgroundColor lib "UIKit" selector "setBackgroundColor:" (aUIView As Ptr, aUIColor As Ptr)
		  ' Here is the corresponding Xojo call
		  decl_SetBackgroundColor(myViewPtr, myUIColorObject)
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
