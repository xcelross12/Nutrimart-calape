VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmManageAgent 
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Manage Agent"
   ClientHeight    =   8250
   ClientLeft      =   8055
   ClientTop       =   2115
   ClientWidth     =   11775
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8250
   ScaleWidth      =   11775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   8115
      Left            =   60
      ScaleHeight     =   8085
      ScaleWidth      =   11625
      TabIndex        =   0
      Top             =   60
      Width           =   11655
      Begin VB.CommandButton cmdAddNewAgent 
         Caption         =   "ADD NEW AGENT"
         BeginProperty Font 
            Name            =   "Century Gothic"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   675
         Left            =   8820
         TabIndex        =   2
         Top             =   960
         Width           =   2655
      End
      Begin VB.TextBox txtSearchAgent 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   180
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   1200
         Visible         =   0   'False
         Width           =   5055
      End
      Begin MSComctlLib.ListView lsvAgent 
         Height          =   6255
         Left            =   180
         TabIndex        =   3
         Top             =   1680
         Width           =   11295
         _ExtentX        =   19923
         _ExtentY        =   11033
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   0
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Search Agent"
         BeginProperty Font 
            Name            =   "Century Gothic"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   180
         TabIndex        =   5
         Top             =   900
         Visible         =   0   'False
         Width           =   2115
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   180
         X2              =   13860
         Y1              =   540
         Y2              =   540
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Manage Agent"
         BeginProperty Font 
            Name            =   "Century Gothic"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   180
         TabIndex        =   4
         Top             =   120
         Width           =   4995
      End
   End
   Begin VB.Menu mnuAgent 
      Caption         =   "Agent"
      Begin VB.Menu mnuDelete 
         Caption         =   "Delete"
      End
   End
End
Attribute VB_Name = "frmManageAgent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAddNewAgent_Click()
    editmode = False
    frmAgentForm.Show 1
End Sub


Private Sub Form_Load()
Call setAgentColumns(lsvAgent)
With lsvAgent
    .ColumnHeaders(1).width = 500
    .ColumnHeaders(2).width = 3000
    .ColumnHeaders(3).width = 5000
    .ColumnHeaders(4).width = 2000
End With

Call loadAgentToListview(lsvAgent)
End Sub

Private Sub lsvAgent_DblClick()
    editmode = True

    activeItemId = Val(lsvAgent.SelectedItem.Text)
    frmAgentForm.Show 1
    
End Sub
Private Sub lsvAgent_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then
        Me.PopupMenu mnuAgent
    End If
End Sub


Private Sub mnuDelete_Click()
     If MsgBox("Are you sure you want to delete?", vbYesNo, "Delete Customer") = vbYes Then
        deleteAgent (Val(lsvAgent.SelectedItem.Text))
        Call loadAgentToListview(lsvAgent)
    End If
End Sub
