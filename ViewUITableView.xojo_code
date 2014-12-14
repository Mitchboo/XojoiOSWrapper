#tag IOSView
Begin iosView ViewUITableView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 1, <Parent>, 1, False, +1.00, 1, 1, 166, 
      AutoLayout      =   Rectangle1, 7, , 0, False, +1.00, 1, 1, 126, 
      AutoLayout      =   Rectangle1, 3, <Parent>, 3, False, +1.00, 1, 1, 35, 
      AutoLayout      =   Rectangle1, 8, , 0, False, +1.00, 1, 1, 392, 
      BorderColor     =   &c00000000
      BorderWidth     =   2.0
      CornerHeight    =   0.0
      CornerWidth     =   0.0
      FillColor       =   &cFFFF3D00
      Height          =   392.0
      Left            =   166
      LockedInPosition=   False
      Scope           =   0
      Top             =   35
      Visible         =   True
      Width           =   126.0
   End
   Begin uitableview Table1
      AutoLayout      =   Table1, 8, , 0, False, +1.00, 1, 1, 320, 
      AutoLayout      =   Table1, 3, <Parent>, 3, False, +1.00, 1, 1, 44, 
      AutoLayout      =   Table1, 2, <Parent>, 2, False, +1.00, 1, 1, -0, 
      AutoLayout      =   Table1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      Height          =   320.0
      Left            =   0.0
      LockedInPosition=   False
      Top             =   44.0
      Width           =   320.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Button1, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Untitled"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   442
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  Table1.AddSection""
		  Table1.AddRow  0, "Foo"
		  Table1.AddRow 0, "Bar"
		  table1.RowHeight = 12
		  
		  table1.AddRow 0, "Rowheight: "+table1.RowHeight.ToText
		  // table1.backgroundview = NIL
		  //  table1.Alpha = 0.6
		  table1.TransparentTable = true
		  Table1.MakeVisibleCellsTransparent
		End Sub
	#tag EndEvent


	#tag Note, Name = Credit
		
		This has been created by Jason King.
		
		For use, you need to drag the UITableView class into your project, as well as the Wrapper module which contains needed additional declares.
	#tag EndNote


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  setSeparatorColor(Table1.Handle,redColor)
		  
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
