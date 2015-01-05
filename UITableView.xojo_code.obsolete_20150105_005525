#tag Class
Protected Class UITableView
Inherits iosTable
	#tag Method, Flags = &h21
		Private Function BackgroundView(id as ptr) As ptr
		  Declare Function backgroundView lib UIKit Selector "backgroundView" (id as ptr) as ptr
		  return backgroundView (id)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function cellForIndexPath(IndexPath as Ptr) As Ptr
		  // Returns a Table cell
		  
		  declare Function cellForRowAtIndexPath lib UIKit selector "cellForRowAtIndexPath:" (id as ptr, indexpath as ptr)as ptr
		  return cellForRowAtIndexPath (handle, IndexPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ClearColor() As Ptr
		  // Returns a Clear NSColor
		  
		  declare function clearColor lib UIKit selector "clearColor" (id as Ptr) as Ptr
		  return clearColor(NSClassFromString ("UIColor"))
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ContentView(id as ptr) As ptr
		  // Returns the contentview of an object
		  
		  Declare Function contentView_ lib UIKit selector "contentView" (id as ptr) as ptr
		  return contentView_ (id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Count(id as ptr) As UInteger
		  Declare Function count_ lib Foundation selector "count" (id as ptr) as UInteger
		  return count_ (id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getBackgroundColor(id as ptr) As Ptr
		  declare Function backgroundColor_ lib UIKit selector "backgroundColor" (id as ptr) as Ptr
		  Return backgroundColor_ (id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IndexPath(row as integer, section as integer) As Ptr
		  // Creates an indexpath
		  
		  // declare function initWithIndex lib UIKit selector "initWithIndex:" (id as ptr, index as uinteger) as ptr
		  declare Function indexPathForRow lib UIKit selector "indexPathForRow:inSection:" (id as ptr, row as Integer, Section as Integer) as ptr
		  
		  return indexPathForRow (IndexPathClass, row, section)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IndexPath(Index as UInteger) As Ptr
		  // Creates an indexpath
		  
		  // declare function initWithIndex lib UIKit selector "initWithIndex:" (id as ptr, index as uinteger) as ptr
		  declare function indexPathWithIndex lib UIKit selector "indexPathWithIndex:" (id as ptr, index as uinteger) as ptr
		  
		  return indexPathWithIndex (IndexPathClass, index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function layer(id as ptr) As ptr
		  Declare function layer_ lib UIKit selector "layer" (id as ptr) as ptr
		  return layer_ (id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeVisibleCellsTransparent()
		  for q as UInteger = 0 to count(visibleCells) -1
		    dim cell as ptr = objectAtIndex (visibleCells, q)
		    setBackgroundColor cell, ClearColor
		  next
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function NSAllocateObject Lib Foundation (aClass as Ptr, extraBytes as UInteger = 0, zone as ptr = NIL) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib Foundation (aClassName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Function objectAtIndex(id as ptr, index as UInteger) As Ptr
		  Declare Function objectAtIndex_ lib Foundation selector "objectAtIndex:" (id as ptr, index as uinteger) as Ptr
		  return objectAtIndex_ (id, index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setAlpha(id as ptr, alpha as single)
		  declare Sub setAlpha lib UIKit selector "setAlpha:" (id as ptr, alpha as single)
		  setAlpha id, alpha
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setBackgroundColor(id as ptr, UIColor as Ptr)
		  declare Sub setBackgroundColor_ lib UIKit selector "setBackgroundColor:" (id as ptr, UIColor as Ptr)
		  setBackgroundColor_ id, UIColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setOpacity(id as ptr, alpha as single)
		  declare Sub setOpacity_ lib UIKit selector "setOpacity:" (id as ptr, alpha as single)
		  setOpacity_ id, alpha
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setOpaque(id as ptr, value as boolean)
		  declare Sub setOpaque_ lib UIKit selector "setOpaque:" (id as ptr, value as boolean)
		  setOpaque_ id, value
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  // for q as uinteger = 0 to me.RowCount(0) -1
			  // dim index as ptr = indexpath(q, 0)
			  // dim cell as ptr= cellForIndexPath(index)
			  // dim contentview as ptr = ContentView (cell)
			  // setAlpha contentview, value
			  // dim background as ptr = BackgroundView (contentview)
			  // next
			  
			  // for q as UInteger = 0 to count(visibleCells) -1
			  // dim cell as ptr = objectAtIndex (visibleCells, q)
			  // dim contentview as ptr = ContentView (cell)
			  // setAlpha contentview,value
			  // dim layer as ptr = layer(contentview)
			  // setOpacity layer, value
			  // next
			  
			  dim bg as Ptr = BackgroundView
			  setAlpha BackgroundView, value
			  setOpaque BackgroundView, false
			  // setBackgroundColor handle, ClearNSColor
			End Set
		#tag EndSetter
		Alpha As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return BackgroundView (handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setBackgroundView lib UIKit Selector "setBackgroundView:" (id as ptr, value as ptr)
			  setBackgroundView handle, value
			  
			End Set
		#tag EndSetter
		Attributes( hidden ) BackgroundView As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if mIndexPathClass = nil then mIndexPathClass = NSClassFromString("NSIndexPath")
			  return mIndexPathClass
			End Get
		#tag EndGetter
		Private IndexPathClass As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mIndexPathClass As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function rowHeight lib UIKit Selector "rowHeight" (id as ptr) as single
			  return rowHeight (handle)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setRowHeight lib UIKit Selector "setRowHeight:" (id as ptr, value as single)
			  setrowHeight handle, value
			  
			End Set
		#tag EndSetter
		RowHeight As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getbackgroundColor (handle) = ClearColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then setBackgroundColor handle, ClearColor
			End Set
		#tag EndSetter
		TransparentTable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  // Returns a NSArray of the visible cells
			  
			  Declare Function visibleCells lib UIKit selector "visibleCells" (id as ptr) as ptr
			  return visibleCells (handle)
			End Get
		#tag EndGetter
		Private visibleCells As Ptr
	#tag EndComputedProperty


	#tag Constant, Name = Foundation, Type = Text, Dynamic = False, Default = \"foundation.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = UIKit, Type = Text, Dynamic = False, Default = \"UIKit", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Behavior"
			Type="iOSTable.Formats"
			EditorType="Enum"
			#tag EnumValues
				"0 - Plain"
				"1 - Grouped"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Double"
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
			Name="RowHeight"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionCount"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="TransparentTable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
