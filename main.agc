
// Project: Creighton 
// Created: 2016-01-03
	
/* notes

		Todo!
			make world save system!
					make code that makes 1000 x 1000 files to represent world biome tiles
						file name "1.2.txt" the "1" stands for x coordinate and the "2" stands for y axis
							sample code:
								for Xaxis = 0 to 1000
									for Yaxis = 0 to 1000
										str(Xaxis) + "." + str(Yaxis) + ".png" = currentFileName // code strings together word tile coordinates into a file name to easily access the world data 
										createfile(currentFileName)
									
									return Yaxis
								return Xaxis






	General
		"Point and click/ text based hybrid"

	coding
		samples
			archived
				
				
				World gen array setup----\/
				
					Dim WorldArray[WorldLengthX, WorldLengthY, TileDataAmount] // (WorldLengthX, WorldLengthY, TileDataAmount) This creates the world region number identifiers and creates storedge for data for each Region  

					For X= 0 to WorldLengthX //starts a counter that fills every coordinate combination with 0
			
						For Y=0 to WorldLengthY
							For Z=0 to TileDataAmount
								WorldArray[X,Y,Z] =0 // fills all of the array levels for the 2d world array with a "0" value(otherwise the array would be useless) 
							Next Z
						Next Y
					Next X 
				
				World gen array setup----^
				
				WRITEING FILES-----\/
					//Create a test file
					GameFirstRunfile$="agktest.txt"
					OpenToWrite(1,GameFirstRunfile$)
					WriteLine(1,"AGK rules!")
					CloseFile(1)  					
				WRITEING FILES------^
				
				IF THEN CASE STATEMENT STUFF
											old stuff to be deleted
							CurrentTile = Random ( 1, 2 ) // selects between two outputs that will define what type of file is underfoot (used in current system and will be removed)
						`Defining the Starting tile outputs	


							If CurrentTile = 1 // sets a string to the value of the current tile (to be removed in next system)
								CurrentTile$ = "Grass" 
							Endif
							
							If CurrentTile = 2 // sets a string to the value of the current tile (to be removed in next system)
								CurrentTile$ = "Dirt"
							endif	
						  
							
							
								TextIdentifier = 0 
							
								select text$ //Observing what the scaracter enters and dose something (currently only searches)
							  case "travel left":
								Print ("Traveling left " )
								P_WantsTravelLeft = 1
								
								Gosub _WorldGenSystem
								
								IsCorrectText = 1
							  endcase
							  
							  case "travel right":
								Print ("Traveling right")
									P_WantsTravelRight = 1
									
									Gosub _WorldGenSystem
								
								IsCorrectText = 1
							  endcase
							  
							  case "surroundings":
								Print ("the ground is "+ CurrentTile$)
								IsCorrectText = 1
							  endcase
							  
							  case "look around":
								Print ("the ground is "+ CurrentTile$)
								IsCorrectText = 1
								
							  endcase
							  
							  case "search":
								Print ("the ground is "+ CurrentTile$)
								IsCorrectText = 1
								
							  endcase
							  
							  case "look at floor":
								Print ("the ground is "+ CurrentTile$)
								IsCorrectText = 1
								
							  endcase
							  
							  case "inspect floor":
								Print ("the ground is "+ CurrentTile$)
								IsCorrectText = 1
							  endcase
							  
							  case default:
								  TextIdentifier = 1
								  DeleteEditBox(1)
								  print("not valid input")
								  sync()
								  Sleep(600)
								  
							  endcase
							  
							endselect

								If TextIdentifier = 1 then Goto EditboxStartlabel



								DirtobjectLootQuant = 10
								GrassobjectLootQuant = 10
								
							
							
							GrassLootItemPickUp = Random ( 0, 2 ) //from 1 to 3		
							
							GrassLootItemID = GrassItemsArray[DirtLootItemPickUp]
							
							
							
							
							
							
							InventorieItemIDCounter = 0
							counter1 = 1
							If CurrentTile = 1
								
								While counter1 < GrassobjectLootQuant // starts a counter1# variable that will run as many times as there is loot

									
									InventorieArray[InventorieItemIDCounter] = DirtLootItemID
									
									INC InventorieItemIDCounter
									INC counter1

								Endwhile
							endif




							DirtLootItemPickUp = Random ( 0, 2 ) //from 1 to 3		
							
							DirtLootItemID = DirtItemsArray[DirtLootItemPickUp]
							
							InventorieItemIDCounter2 = 0
							counter2 = 1
							
							If CurrentTile = 2
								
								While counter2 < DirtobjectLootQuant // starts a counter1# variable that will run as many times as there is loot
									
									InventorieArray[InventorieItemIDCounter2]= DirtLootItemID
									
									INC InventorieItemIDCounter2
									INC counter2
								Endwhile
				
				
				CREATING MULTIPLE SPRITES
										ButtonRowGenHeightPosCounter = - 300 // this is a counter variable. defines how high the first row is. lower the number the higher.
										
										ButtonGenDone = 0
										
										For ButtonRowGen = 0 to 6 //defines how many rows of sprites there are
											ButtonsGenCounter = 100 // defines how far the starting sprites are from the center and is incremented .
											
											ButtonsGenSprites = 1 //generic start variable for all of the ids of the sprites
											
											GenAdd = 1 //generic start variable for the switch sides variable. 1 is to the right. -1 is to the left 
											
											ButtonsGenEnd = 10 //defines how many sprites are in a row overall
											For ButtonsGen= 1 to ButtonsGenEnd
											
												ButtonsGenSprites = CreateSprite ( 0000001 ) // creates a sprite every time its run with a different id because of the ButtonsGenSprites counter 
												
												If ButtonsGen = ButtonsGenEnd / 2 + 1 then GenAdd = -1
												If ButtonsGen = ButtonsGenEnd / 2 + 1 then ButtonsGenCounter = 100
												
												If GenAdd = 1 then SetSpritePositionByOffset(  ButtonsGenSprites, XDisplayC / 2 + ButtonsGenCounter, YDisplayC / 2 + ButtonRowGenHeightPosCounter )
												
												If GenAdd = -1 then SetSpritePositionByOffset( ButtonsGenSprites, XDisplayC / 2 - ButtonsGenCounter, YDisplayC / 2 + ButtonRowGenHeightPosCounter )
											
												ButtonsGenCounter = ButtonsGenCounter + 100
												
												ButtonsGenSprites = ButtonsGenSprites + 1						
												
											Next ButtonsGen
											ButtonRowGenHeightPosCounter = ButtonRowGenHeightPosCounter + 100
										Next ButtonRowGen
										
										ButtonGenDone = 1
										Repeat
											
												ButtonID = 1
											
											For ButtonActivate = 1 to 70

												ButtonGenX = GetSpriteXByOffset( ButtonActivate )
												ButtonGenY = GetSpriteYByOffset( ButtonActivate )
												
												While GetSpriteHitTest( ButtonID,GetPointerX(),GetPointerY())
													
													Print("itWorks")
													sync()
													
													If DevMode = 1 then print("Mouse is over Sprite")
													sync()						
													While GetPointerPressed ( ) = 1
														SetSpritePositionByOffset( 2, ButtonGenX / 2, ButtonGenY / 2 + 30) //sets the button sprite's position by an offset(its center) current settings make the sprite lower than the center of the screen. 
														TitalScreenExit = 1
														WorldSelectEnter = 1
														sync()
														
														If DevMode = 1
															if GetRawKeyPressed(27)  //Esc
																Exit                  //Close App
															endif
														endif	
														sync()
													EndWhile
													sync()	
												EndWhile
											
												ButtonID = ButtonID + 1
											
												sync()
											Next ButtonActivate
											
											
											
											sync()
										Until GetPointerPressed ( ) = 1
										
										sync()
			
			
			
				tital-screen
					//Tital screen initialization codeV1------------------------------------------------------\|/
						LoadSprite( 1, TitalScreenImage$ )
						If GameRun = 0 // if the game has not been run yet then the titalscreen loop starts 
							
							TitalScreenExit = 0
							While TitalScreenExit = 0 //loop with variable to exit if a button is pressed 
								
								
								LoadSprite( 0000000, TitalScreenImage$ )
								AddVirtualButton( 1, XDisplayC / 2, YDisplayC / 2, 50 )
								//SetVirtualButtonImageUp( index,  ) // code captured for later image to be made
								sync() //updates the screen so that the tital screen can be seen
							EndWhile  
						endif
					//Tital screen initialization code endV1------------=-0---=--------------------------------^
					
					
					//Tital screen initialization codeV2--------------------------------------------------------\|/
		
							If GameRun = 0 // if the game has not been run yet then the titalscreen loop starts 
								
								TitalScreenExit = 0 //
								//load inital sprites and images. some are buttons---\|/
									LoadSprite( 1, TitalScreenImage$ )
									LoadSprite( 2, ButtonProto$ )

										
										SetSpriteShapeBox( 2,  -52, -60, 52, 60,45 ) // makes a square hitbox for the button  coordinates for square hitboxes are from the position of the sprite 0,0 and must be the total height and width divided by 2 and the first 2 must be negitive.
										SetSpritePositionByOffset( 2, XDisplayC / 2, YDisplayC / 2 + 20) //sets the button sprite's position by an offset(its center) current settings make the sprite lower than the center of the screen. 
								//load inital sprites and images end------------------^
								
									
									While TitalScreenExit = 0 //loop with variable to exit if a button is pressed 
										mouseX = GetPointerX()
										mouseY = GetPointerY()
										
										//new button code------\|/
										
											if GetPointerState()
												if GetSpriteHitTest( 2,GetPointerX(),GetPointerY())
													print("Mouse is over Sprite")
												endif
											endif
												
											print( mouseX)
											print( mouseY)
											print( ScreenFPS())
										
										//new button code-------^
									
										//SetVirtualButtonImageUp( index,  ) // code captured for later image to be made
										sync() //updates the screen so that the tital screen can be seen !!!!!!Important to do this in all loops that have graphics!!!!!!!
										
									EndWhile  
								endif
					//Tital screen initialization code endV2--------------=-0---=--------------------------------^
		
				
		variables
			identifiers
				images	
					0,000,000 -> 9,999,999
						0,000,000
							0000000 = tital image
		display
			storage
				display
					for T=1 to 5
						Print("test")
						INVItemID = InventorieArray[T]
						Gosub _IVN1decoder
						TEXTPOS= T*30 + 80
						CreateText (T, INVItemname$ )
						SetTextPosition ( T, 640,TEXTPOS)
						SetTextSize ( T, 35)
						SetTextAlignment( T, 2 )
					next T
		editbox stuff
			EditboxStartlabel: // label usde for incorrect text input 
			CreateEditBox(1) //crates a text input used for main game world interface
				SetEditBoxActive(1,1) //makes the  
				SetEditBoxFocus(1,1)
				SetEditBoxPosition(1,10,100)
       
			Repeat //repeat loop that waits for user text input \|/
				Print ("placeholder")
				Sync()
				
				Until (GetEditBoxChanged(1)=1) //End Comment---------^
	
				text$ = GetEditBoxText(1) //sets the text in textbox to a variable   
				
	Graphical
	
	Content
		Character
			mechanics
				sleeping
					sleep for a random time ( cycles)
			Affinities
				Affinity system
					different Affinity routes of speciality in specifc crafts and trades. if the majority of the work you do is in a specific rout then you shall become better in that affinity.
					 The major affinity routes have different crafting systems.
						
				major
					Mage
						crafting system
							magical processes, dusts, essesnces, infusing, enchanting, ect...
						sub-Affinities
							Necromancy
							
							pyromancy
							
							epothacary
							
					Mechanist
						crafting system
							mechanical machienery, steam power, basic robotics,
						sub-Affinities
							Steam engineer
							
							Clocksmith
							
							
					Alchemist
						crafting system
							chemical synthesis, chemical reactions, potions, chemist's apparatices, evaporation, acids, ect..
						sub-Affinities
						 
					Materialist
						crafting system
							collection of materials and assembling them by hand, different workbenches, hand powered tools, tools, blacksmithing.
						sub-Affinities
							Blacksmith
							
							LeatherWorker
							
							Carpenter
							
							
				Minor
					Scavenger/looter
					
					
				
		World
			mechanics
				planet
					start on a different
				time
					1 tyke is the smallest length of time.
					10 tykes is a tick.
					cycle = 250-370 ticks cycle = 2500-3700 tykes ( CycleLengthTicks = Random(250,370)
						defaultDayHalf = CycleLengthTicks / 2   
						DayRangeStart = defaultDayHalf - 20 
						DayRangeEnd = defaultDayHalf + 20
						DuskTime = Random( DayRangeStart, DayRangeEnd) 
					1Day= 1cycle  
			Biomes
			random events
				Random encounters 
					monkey with weapon( random but high chance to have a "GunWand" type of gun and wand are random. The monkey can talk and can be reasoned with. Convorsation:" I didn't know what to do with these things so i shoved them together.  "
					
				World generated
					Random Biome cities( after generation is done if can citi gen = true then random citi type)
					NukeCaves( natural nuclear reactor caves)
	

*/

// set display properties \|/
	
	XDisplayC = 1080
	YDisplayC = 720
  SetVirtualResolution(XDisplayC,YDisplayC)
	
					//First must be greater than last
	// end---------------------^

	// starting variables    \|/
		`Intergers------------------------\/
			CurrentX 		= 50
			CurrentY 		= 50
			CurrentBiomeNum = 0
			TileGenCounter 	= 0
			IsStartTile 	= 1
			DevMode 		= 1
			
			
		`Intergers end--------------------^
		
		`Strings---------------------------------------------------------\/
			CurrentBiomeStr$	= ""
			TitalScreenImage$	= "Creighton1280x720.png"
			ButtonProto$		= "Continue_button_done.png"
			WordSelectImage$	= "WORLDS.bmp"
		`Strings End-----------------------------------------------------^
		
		`starting File names--------------------------------------------\/
			GameFirstRunfile$   ="A_first_Time_Run.txt"
			
		`starting File names--------------------------------------------^
		
		
	// starting variables end ^
	
	
	
	
	/*Create first time run file and input value
	 1/0 if the current game session is the first*/
	
	If GetFileExists( GameFirstRunfile$)
		 OpenToRead( 1 ,GameFirstRunfile$ )
		GameFirstRun = Val(ReadLine(1)) /*GameFirstRun defines weather 
		or not all the functionsand code that need to run at the 
		first game run actually run*/
		CloseFile(1)	
	else//if the file does not run then create it and set it to true(1=true)
		OpenToWrite(1,GameFirstRunfile$)
		WriteLine(1,"1")
		CloseFile(1)  
	endif
	
	
	
	
	
	
	
	


SetErrorMode( 1 )
SetWindowTitle( "Creighton" )







` load resources	
//load Images-------------------------------------\|/
	//menue/Gui Images-------------------------------------\|/
		LoadImage( 0000000, TitalScreenImage$,	0 )
		LoadImage( 0000001, ButtonProto$, 		0 )
		LoadImage( 0000002, WordSelectImage$,	0 )
		LoadImage( 0000003, "stars.png",     	0 )
		LoadImage( 0000004, "WorldButton.png", 	0 )
		
	//menue/Gui Images end----------------------------------^
	
//load Images end----------------------------------^

//static sprites-----------------------------\|/
	//menue/gui sprites----------------------------\|/
			//static image sprites----------------------------\|/
				
			//static image sprites end-------------------------^
					
	//menue/gui sprites end-------------------------^

//static sprites end--------------------------^


	



//main Inventory array handling---------------------------------------------------------------------------------------------------\|/
	
	DIM InventorieArray[64]  //start the empty character inventory with 64 slots
		For U= 0 to 64// start a loop that starts all slots with 0
			InventorieArray[U] =0
		Next U 
// End comment<-	
	
	
	DirtItemsArray as integer[2] // (used for current system will be removed)used as results for what tile is undefoot.
		DirtItemsArray[0] = 12 
		DirtItemsArray[1] = 13 
		DirtItemsArray[2] = 14 
		DirtItemsArray.sort() // end <-
		
		`Grass tile loot item array
	
	
	GrassItemsArray as integer[2] // (used for current system will be removed) used as results for what tile is undefoot. \|/
		GrassItemsArray[0] = 12 
		GrassItemsArray[1] = 13
		GrassItemsArray[2] = 14 
		GrassItemsArray.sort() // end <-
//end of main Inventory array handling--------------------------------------------------------------------------------------------^
		
	

	text$ = "" //starting variable for main game text input 	
	GameRun = 0 
	
	

	
	Gosub _WorldGenSystem
	
	
	
do
	// getting mouse pointer code for later use. is needed inside of contained loops for sprite buttons.--\|/
		
	//getting mouse pointer code end-----------------------------------------------------------------------^
	
	Gosub _WorldGenSystem
	
	Gosub _SetPointRCoordinates // calls a gosub that saves pointer coordinates

	Gosub _DisplayCoordinates // calls a gosub that displays the player's region coordinates
	

		//Tital screen initialization code--------------------------------------------------------\|/
		
		
			
			TitalScreenExit = 0 //
			//load inital sprites and images. some are buttons---\|/
			
				
				LoadSprite( 1, TitalScreenImage$ )
				LoadSprite( 2, ButtonProto$ )

					
					SetSpriteShapeBox( 2,  -52, -60, 52, 60,45 ) // makes a square hitbox for the button  coordinates for square hitboxes are from the position of the sprite 0,0 and must be the total height and width divided by 2 and the first 2 must be negitive.
					SetSpritePositionByOffset( 2, XDisplayC / 2, YDisplayC / 2 + 20) //sets the button sprite's position by an offset(its center) current settings make the sprite lower than the center of the screen. 
			//load inital sprites and images end------------------^
			
			
			While TitalScreenExit = 0 //loop with variable to exit if a button is pressed 
				SetSpritePositionByOffset( 2, XDisplayC / 2, YDisplayC / 2 + 20) //sets the button sprite's position by an offset(its center) current settings make the sprite lower than the center of the screen. 
				mouseX = GetPointerX()
				mouseY = GetPointerY()
				
				//new button code------\|/
				
					If GetSpriteHitTest( 2,GetPointerX(),GetPointerY())
						If DevMode = 1 then print("Mouse is over Sprite")						
						While GetPointerState()
							SetSpritePositionByOffset( 2, XDisplayC / 2, YDisplayC / 2 + 30) //sets the button sprite's position by an offset(its center) current settings make the sprite lower than the center of the screen. 
							TitalScreenExit = 1
							WorldSelectEnter = 1
							sync()
							
							If DevMode = 1
								if GetRawKeyPressed(27)  //Esc
									Exit                  //Close App
								endif
							endif	
							
						EndWhile
							
					Endif
				//new button code-------^	
					
				//display the mouse x and y coordinates and fps if devmode is on
					If DevMode = 1
						PrintC( "mouseX =" ) // "The next Print or PrintC command will follow on directly from this one."
						print(mouseX)
						PrintC( "mouseY =" )
						print(mouseY)
						PrintC( "FPS    =" )
						print(ScreenFPS())
					EndIf
		
				sync() //updates the screen so that the tital screen can be seen !!!!!!Important to do this in all loops that have graphics!!!!!!!
				If DevMode = 1
					if GetRawKeyPressed(27)  //Esc
						Exit                  //Close App
					endif
				endif
			EndWhile
				If WorldSelectEnter = 1
					
				WorldScreenSprite = CreateSprite ( 0000003 ) //sprite that serves as the background for thw world selection screen
				SetSpriteDepth ( WorldScreenSprite, 11 ) //sets the depth of the background sprite to the background 

					For TitalExitAnimation = 0 to 50
						
						SetSpritePositionByOffset( 1, XDisplayC / 2, YDisplayC / 2 + 20 + (TitalExitAnimation * 20))
						SetSpritePositionByOffset( 2, XDisplayC / 2, YDisplayC / 2 + 20 + (TitalExitAnimation * 20))
						sync()
					Next TitalExitAnimation
					//dsiable sprites drom the tital menue
						DeleteSprite( 1 ) //disable the tital menue backround
						DeleteSprite( 2 ) //disable the tital menue Continue button
						sync()  
				Endif

		//Tital screen initialization code end--------------=-0---=--------------------------------^	
		
		
		// gamesave screen menue---------------------------------------------------------------------------------\|/                                                 menue start
			If TitalScreenExit = 1 
				
				GameSaveScreenExit = 0
				
				
				// world save sprites\/
				
					firstTimeRun = 1
				For WorldSpriteCounter = 801 to 806//numbers define both times run and the ids of the sprites.
					 CreateSprite ( WorldSpriteCounter, 0000004 )
					 
					 If firstTimeRun = 1
						 Startingsprite1X = 90
						 Startingsprite1y = 110 
						setSpritePositionByOffset( 801 , Startingsprite1X, Startingsprite1y) 
					 else 
						setSpritePositionByOffset( WorldSpriteCounter , GetSpriteX( WorldSpriteCounter - 1) + GetSpriteWidth(WorldSpriteCounter - 1) + (GetSpriteWidth(WorldSpriteCounter - 1) / 2)  , 110)
					 endif
					 
					 firstTimeRun = 0
					
					 sync()
				Next WorldSpriteCounter
					firstTimeRun = 1
				For WorldSpriteCounter2 = 901 to 906//numbers define both times run and the ids of the sprites.
					 CreateSprite ( WorldSpriteCounter2, 0000004 )
					 
					 If firstTimeRun = 1
						 print("good2")
						 Startingsprite2X =90
						 Startingsprite2y = Startingsprite1y + GetSpriteHeight(801)
						setSpritePositionByOffset( 901 ,Startingsprite2X , Startingsprite2y) 
					 else 
						setSpritePositionByOffset( WorldSpriteCounter2 , GetSpriteX( WorldSpriteCounter2 - 1) + GetSpriteWidth(WorldSpriteCounter2 - 1) + (GetSpriteWidth(WorldSpriteCounter2 - 1) / 2)  , Startingsprite2y)
					 endif
					 
					 firstTimeRun = 0
					 
						
					 sync()
				Next WorldSpriteCounter2
				
					firstTimeRun = 1
				For WorldSpriteCounter3 = 1001 to 1006//numbers define both times run and the ids of the sprites.
					 CreateSprite ( WorldSpriteCounter3, 0000004 )
					 
					 If firstTimeRun = 1
						 print("good2")
						 Startingsprite3X =90
						 Startingsprite3y = Startingsprite2y + GetSpriteHeight(901)
						setSpritePositionByOffset( 1001 ,Startingsprite3X , Startingsprite3y) 
					 else 
						setSpritePositionByOffset( WorldSpriteCounter3 , GetSpriteX( WorldSpriteCounter3 - 1) + GetSpriteWidth(WorldSpriteCounter3 - 1) + (GetSpriteWidth(WorldSpriteCounter3 - 1) / 2)  , Startingsprite3y)
					 endif
					 
					 firstTimeRun = 0
					 
						
					 sync()
				Next WorldSpriteCounter3				
				
					//setSpritePositionByOffset( 801 , 100, 110) //is placed first so that all previous can be placed relitive to its position.... 
					
				//WSP----------------^
					OpenReadBoolean= 0
				While GameSaveScreenExit = 0 // Good example of many sprites being spaced out and made continueously 
					
					
					
					
					If OpenReadBoolean = 0
						OpenToRead( 1 ,GameFirstRunfile$ )
						cake$ = ReadLine(1)	
						file_path$ = GetWritePath()
						SetPrintSize( 20 )
						OpenReadBoolean = 1
					endif
						print(file_path$)
						If cake$ = "1"
							print("FirstGameRun = True")
						else
							print("FirstGameRun = False")
						endif	
						sync()

					
     
					
					
					CloseFile(1)
					
					
					
					
					
					
					sync()
					
					
					if GetRawKeyPressed(27)  /*Esc code that makes the game close 
						and go through procedures needed before closing */
						OpenToWrite(1,GameFirstRunfile$)
						WriteLine(1,"0")
						CloseFile(1)
							If DevMode = 1
								OpenToWrite(1,GameFirstRunfile$) /*code that makes the computer\/
								 think every time is the first */
								WriteLine(1,"1")
								CloseFile(1) //------------------------------------------------^
								end                  //Close App
							endif
						End                  //Close App
					endif
					
					
					
				EndWhile
			endif
		// gamesave screen menue end------------------------------------------------------------------------------^
    
/*	
 
	endif
*/	

	
		
	 Sync()
	 
	Sleep(900) //wait for info to bee seen after text input(current use)
	
	GameRun = GameRun + 1 
	
    ` update the screen
    // Print( ScreenFPS() )
    Sync()
    
    OpenToWrite(1,GameFirstRunfile$)
			WriteLine(1,"0")
			CloseFile(1)
    
    
	If DevMode = 1
		if GetRawKeyPressed(27)  //Esc
			
			OpenToWrite(1,GameFirstRunfile$) /*code that makes the computer\/
			 think every time is the first */
			WriteLine(1,"1")
			CloseFile(1) //------------------------------------------------^
			
			Exit                  //Close App
		endif
	endif
	
	
	
loop


` save any settings such as state of the game

` clear resources
exit



_SetPointRCoordinates: // \|/
	// setting the pointers position coordinates as variables	\|/
		PointRX = GetPointerX ( )
		PointRY = GetPointerY ( )
	// setting the pointers position coordinates as variables	 ^
Return//                   ^ 


_IVN1decoder:
		
		INVItemID = 1 //place holder to make the code happy and is for displaying
		
		If INVItemID = 1 then INVItemname$ = "oak stick"
		If INVItemID = 2 then INVItemname$ =  "birch stick"
		If INVItemID = 3 then INVItemname$ =  "mapel stick"
		If INVItemID = 4 then INVItemname$ =  "pine stick"
		If INVItemID = 5 then INVItemname$ =  "oak bark"
		If INVItemID = 6 then INVItemname$ =  "Birch bark"
		If INVItemID = 7 then INVItemname$ =  "maple bark"
		If INVItemID = 8 then INVItemname$ =  "pine bark"
		If INVItemID = 9 then INVItemname$ =  "acorn" 
		If INVItemID = 10 then INVItemname$ =  "mapel spinner"
		If INVItemID = 12 then INVItemname$ =  "pine cone"
		If INVItemID = 13 then INVItemname$ =  "Pebble"
		If INVItemID = 14 then INVItemname$ =  "Twig"
		If INVItemID = 15 then INVItemname$ = "RustedNail"
return

_WorldGenSystem:



//Satrts the worldspace storage system------------------------------------------------------------------------------------------------------------------------------------------------------------------------\|/
	WorldLengthX = 100 //amount of coordinates on the X vertecy  
	WorldLengthY = 100 //amount of coordinates on the Y vertecy 
	TileDataAmount = 10 // aount of data slots wor world tiles

	Dim WorldArray[WorldLengthX, WorldLengthY, TileDataAmount] // (WorldLengthX, WorldLengthY, TileDataAmount) This creates the world region number identifiers and creates storedge for data for each Region  

		For X= 0 to WorldLengthX //starts a counter that fills every coordinate combination with 0
			
			For Y=0 to WorldLengthY
				For Z=0 to TileDataAmount
				WorldArray[X,Y,Z] =0 // fills all of the array levels for the 2d world array with a "0" value(otherwise the array would be useless) 
				Next Z
			Next Y
		Next X 
	
/*	
	World array notes:
	 WorldArray[x, y, 1] = [biometype] 
	WorldArray[x, y, 2] = [biome]
	
 
	
*/	
	
	For GenX=1 To WorldLengthX
		For GenY=1 To WorldLengthY
			
			
			
			
		//surrounding tile data array handling \|/ 
		STileDataSlots = 2
		
		Dim STileData[8, STileDataSlots]
		
		For STileDataTilesC= 0 to 8// start a loop that starts all slots with 0
			For STileDataSlotsC= 0 to 2
				STileData[STileDataTilesC, STileDataSlotsC] =0
			Next STileDataSlotsC	
		Next STileDataTilesC 
/*		
	812	
	7 3	
	654	
		
*/	
	// End comment<-
	
	

//end of worldspace storage system----------------------------------------------------------------------------------------------------------------------------------------------------------------------------^





			if IsStartTile = 1
				WorldArray[ 0, 0, 1] = random(1, 5)
			
				
				If WorldArray[ GenX, GenY + 1, 1] = 1 
					ToBeInserted = random(1,6)
				Endif
				If WorldArray[ GenX, GenY + 1, 1]= 2 
					ToBeInserted = random(7,12)
				Endif
				If WorldArray[ GenX, GenY + 1, 1] = 3 
					ToBeInserted = random(13,18)
				Endif
				If WorldArray[ GenX, GenY + 1, 1] = 4 
					ToBeInserted = random(19,24)
				Endif
				If WorldArray[ GenX, GenY + 1, 1] = 5 
					ToBeInserted = random(25,30)
				Endif
				WorldArray[ 0, 0, 2] = ToBeInserted
				
			endif 

	
			
			
			
			
			
			IsStartTile = 0 

		//biome detection system(dectects the biomes of the surroundingworld tiles)--------------------------------------------\/
			
			GenSouthTilex = GenX
			GenSouthTileY = GenY + 1 
			if GenSouthTileY < WorldLengthY
				STileData[5,1] = WorldArray[ GenX, GenY + 1, 1]
			endif
			If GenSouthTileY > WorldLengthY then GenSouthEdgeReached = 1
			
			GenNorthEastTileX = GenX + 1
			GenNorthEastTiley = GenY - 1			
			If GenNorthEastTileX < WorldLengthX and GenNorthEastTileY > 0
				STileData[2,1] = WorldArray[ GenX + 1, GenY - 1, 1]
			endif
			If GenNorthEastTileX > WorldLengthX and GenNorthEastTileY < 0 then GenNorthEastEdgeReached = 1
			
			GenNorthWestTileX = GenX - 1
			GenNorthWestTiley = GenY - 1 			
			If GenNorthWestTileX > 0 and GenNorthWestTileY > 0 
				STileData[8,1] = WorldArray[ GenX - 1, GenY - 1, 1]
			endif
			If GenNorthWestTileX < 0 and GenNorthWestTileY < 0 then GenNorthWestEdgeReached = 1
			
			GenSouthEastTileX = GenX + 1
			GenSouthEastTiley = GenY + 1
			If GenSouthEastTileX < WorldLengthX and GenSouthEastTileY < WorldLengthY
			 STileData[4,1] = WorldArray[ GenX + 1, GenY + 1, 1]
			endif
			If GenSouthEastTileX > WorldLengthX and GenSouthEastTileY > WorldLengthY then GenSouthEastEdgeReached = 1
			
			
			GenSouthWestTileX = GenX - 1
			GenSouthWestTiley = GenY + 1 
			If GenSouthWestTileX > 0 and GenSouthWestTileY < WorldLengthX
				STileData[6,1] = WorldArray[ GenSouthWestTileX, GenSouthWestTiley, 1]
			endif
			If GenSouthWestTileX > WorldLengthX and GenSouthWestTileY < 0 then GenSouthWestEdgeReached = 1

			 
			GenNorthTileX = GenX
			GenNorthTileY = GenY - 1
			If GenNorthTileY > 0 
				STileData[1,1] = WorldArray[ GenX, GenY- 1, 1]
			endif
			If GenNorthTileY < 0 then GenNorthEdgeReached = 1


			GenEastTileX = GenX + 1
			GenEastTileY = GenY
			If GenEastTileX < WorldLengthX 
				STileData[3,1] = WorldArray[ GenX + 1, GenY, 1]
			endif
			If GenEastTileX > WorldLengthX then GenEastEdgeReached = 1


			GenWestTileX = GenX - 1
			GenWestTileY = GenY
			If GenEastTileX > WorldLengthX 
				STileData[7,1] = WorldArray[ GenX - 1, GenY, 1]
			endif 
			If GenEastTileX < WorldLengthX then GenEastEdgeReached = 1
		//biome detection system-end-------------------------------------------------------------------------------------------/\
			
		//Biome generation start
biomeGen1Restart:
		// starting with clean variables so when gen fails and loops thins dont jumble up
		biomegeninit = 0
		biomeGenType = 0
		biomeGenTypeName$ = ""
			// setting the type of biome to generate 1/5
			biomeGenType = random(1, 5)
				// setting a string to the biome gen type for display purposes
				If biomeGenType = 1 then biomeGenTypeName$ = "Cold"
				If biomeGenType = 2 then biomeGenTypeName$ = "Cold to temperate"
				If biomeGenType = 3 then biomeGenTypeName$ = "Temperate"
				If biomeGenType = 4 then biomeGenTypeName$ = "Temperate to warm"
				If biomeGenType = 5 then biomeGenTypeName$ = "Warm"
			// randomizers for each biome type but this needs to be changed to a different way in order to add new biomes
			If biomeGenType = 1 
				biomegeninit = random(1,6)
			Endif
			If biomeGenType = 2 
				biomegeninit = random(7,12)
			Endif
			If biomeGenType = 3 
				biomegeninit = random(13,18)
			Endif
			If biomeGenType = 4 
				biomegeninit = random(19,24)
			Endif
			If biomeGenType = 5 
				biomegeninit = random(25,30)
			Endif
		// starting if-then statements to fail and loop the gen process if the biome is not supposed to be around certian biomes
			//cold biome pass/fail
				For CounterBiome = 1 to 8
					If biomeGenType = 1 and STileData[CounterBiome,1] = 3 then goto biomeGen1Restart 
					If biomeGenType = 1 and STileData[CounterBiome,1] = 4 then goto biomeGen1Restart 
					If biomeGenType = 1 and STileData[CounterBiome,1] = 5 then goto biomeGen1Restart 
				Next CounterBiome 
			// Cold to temperate pass/fail
				For CounterBiome = 1 to 8
					If biomeGenType = 2 and STileData[CounterBiome,1] = 4 then goto biomeGen1Restart 
					If biomeGenType = 2 and STileData[CounterBiome,1] = 5 then goto biomeGen1Restart 
				Next CounterBiome
			//temperate pass/fail
				For CounterBiome = 1 to 8
					If biomeGenType = 3 and STileData[CounterBiome,1] = 1 then goto biomeGen1Restart 
					If biomeGenType = 3 and STileData[CounterBiome,1] = 5 then goto biomeGen1Restart 
				Next CounterBiome 
			//tepmerate to warm pass/fail
				For CounterBiome = 1 to 8
					If biomeGenType = 1 and STileData[CounterBiome,1] = 1 then goto biomeGen1Restart 
					If biomeGenType = 1 and STileData[CounterBiome,1] = 2 then goto biomeGen1Restart  
				Next CounterBiome 
			//warm pass/fail
				For CounterBiome = 1 to 8
					If biomeGenType = 1 and STileData[CounterBiome,1] = 1 then goto biomeGen1Restart 
					If biomeGenType = 1 and STileData[CounterBiome,1] = 2 then goto biomeGen1Restart 
					If biomeGenType = 1 and STileData[CounterBiome,1] = 3 then goto biomeGen1Restart 
				Next CounterBiome 
				
				WorldArray[ GenX, GenY, 1] = biomeGenType
				WorldArray[ GenX, GenY, 2] = biomegeninit

			For STileDataTilesC= 0 to 8// start a loop that starts all slots with 0
				For STileDataSlotsC= 0 to 2
					STileData[STileDataTilesC, STileDataSlotsC] =0
				Next STileDataSlotsC	
			Next STileDataTilesC 			
			
			
						GenWestTileX = 0
			GenWestTileY = 0
			GenSouthWestEdgeReached = 0
			
			GenEastTileX = 0
			GenEastTileY = 0
			GenEastEdgeReached = 0
			
			GenNorthTileX = 0
			GenNorthTileY = 0
			GenNorthEdgeReached = 0
			
			GenSouthTilex = 0
			GenSouthTileY = 0
			GenSouthEdgeReached = 0
			
			GenSouthWestTileX = 0
			GenSouthWestTiley = 0
			GenSouthWestEdgeReached = 0
			
			GenNorthWestTileX = 0
			GenNorthWestTiley = 0
			GenNorthWestEdgeReached = 0
			
			GenSouthEastTileX = 0
			GenSouthEastTileY = 0
			GenSouthEastEdgeReached = 0
			
			GenNorthEastTileX = 0
			GenNorthEastTiley = 0
			GenNorthEastEdgeReached = 0
			
			
			
			
		Next GenY
	Next GenX
	
	
	
	TileGenCounter = 0
Return

_BiomeDecoder:
	CurrentBiomeNum = WorldArray[ CurrentX, Currenty, 1]
	
/* biome notes
		numbers
			Cold cold
				Shrawn= 1
				Tundra = 2
				Drael = 3
				Roughlands = 4
				Smirgelands = 5
				Blint = 6
			Cold to T
				1
					Crives = 7
					Drelsk = 8
				2
					Shrill_hollows =9
					Shrewn_Forest = 10
				3
					Hills_of_Oculos = 11
					Drund_Planes = 12
			Temperate
				Toofla = 13
				Gareth =14
				Strintug = 15
				Ruins = 16
				Bandits =17
				Magna_Herba = 18	
			Tem to warm
				Situ_Palude = 19
				Chuta Jung =20
				Valic = 21
				Shinvar = 22
				Tinchutu = 23
				Slog = 24
			Warm
				Shrindo = 25
				Rindge = 26
				Bala_Nin = 27
				Smern = 28
				Fwinfawn = 29
				Badlands = 30	
	Biome types(
		cold(
			ColdCold[1]( 
					
				)
				land(
					Shrawn{chance:medium} [ A snow covered forest who's evergreen trees secreet a thick sap.       ]
					Tundra{chance:high}[ a vast plane of snow, populated only by small shrubbery sparsely distributed over the landscape]  
					Drael{chance:low}[ Large crystals protrude from the ground, the ground is made of flaking stacked layers of ice, the ground smoothly curves into almost solid ice dunes, ]
					Roughlands{chance:medum}[ glacier-covered land which consisists of raised and lowered cubic shapes.]
					Smirgelands{chance:very low}[ a landscape that shades into darker and darker blue snow as you approach it. Villimus, slimy foul blue creatures who's only desire is to cover any living thing with their bodies, creep along this landscsape.      
					Blint{chance: common)[ Sections of tundra that experience constant blizzards]
				)	
				
			)
			ColdToTemperateTransition[2 ](
			
				ColdToTemperateTransition"starting from cold biome type"  1 (
					Crives{chance:medum}[ Shards of ice are forced through openings in the eath in this landscape of slight mounds and ice covered ground]   
					Drellsk{chance:low}[ The dead stone forests that dot this snowy landscape are believed by the locals to be ancient and petrified from a time when the world was mutch warmer. ]  
				)
				ColdToTemperateTransition 2	(
					Shill_Hollows{chance:medum}[ These cold thick forests are home to trees whose leaves are long and thin. Stories been told of times in which travelers hear sounds of screems intertwined with the wind that blows through the trees. ] 
					Shrewn_Forest{low}[ Trees as Tall as the eye can see grow from a gorund coated with a layer of wooden peels that the giants shed off their trunks occasionally.  ]
				)
				ColdToTemperateTransition"ending at temperat 3	(
					Hills_of_oculos{chance:Rare}[ smooth hills with ankle high grass. Those who bare witness to this landscape cannot help feel like they are being watched. It is a wonder why some prefer to take shelter here. ]
					drund_plains{chance:High}[ What seem to be ordinary fields of green swaying grass hold hidden enrtances to underground passeges. ]
				)
			)	
		temerate[3](
		
			land(
				Toofla{chance:rare}[ forests of tall white birch whose leaves remain pink throught the year. ]
				Gareth"medow of the sleeping stones"{chance:medum}[ Meadows of short green flower bearing grass are home to stones of great magnitude and small alike. these stones stand upright and each are adorned with a unique carved symbol porportional to their size.]  
				Strintug"crystall forest"{chance:low}[ A forest of oaktrees spaced evenly enouggh for small shrubbery to grow in between. The strong tall oaks of this forest tend to intertwine themselves with the large crystalls strewn about the labscape. 
					These forests may not make the best resting places during the night for they glow from the many crystal formations.   ] 
				Ruins(many types:?){chance:medium}[The embers of a ruined house smolder. The smells of burning paint and rubber hang in the air. The wastes of various civizations lie in these desolate decaying places.   ]
				bandit_InsertWarlordNameHere_'s territory{chance:?}[ Bandit terrirory.   ]  
				Magna Herba{chance:rare}[ A land in wich small Gnomes live underneath the towering grass. Defended by the traps of the gnomes their homes are hidden.   ]
			(
			
		TemperateToWarm[4](
			
			stage1( 
				situ palude{chance:low}[ Mushy mushy mushroom swamps who's trees provide roots that travellers may walk on. p.s. the unicorns are coming for you.   ]
				Chuta Junga{chance:Rare}[ a Giant fruit tree grows in the middle of these lands. Giant Fruits will fall into the mess of vines blow which form tunnels. Giant insects such as bees also exsist and you can get the honey.   ]
			)
			
			stage2(
				Valic_insertMetalHereInLatin_{chance:low}[_insertMetalHere_ volcano that spews out molten metal. Chance to erupt and you have to out run the eruption. chance to also have already have erupted. Volcanic caves that you can enter. Metal dragons. Random chance to either have uranium or thorium NukeCanos and you have to stay out due to radiation.  ]
				Shinvar{chance:common}[ Rain(steam)forest. The ground will spew out streems of steam because the plants re-heat the water. plants are collored neon colors in a large range.] 
			)
			
			stage3
				Tinchutu{chance:?}[ irradiated savana. gloowing girrafs. winds of radiation. needs radiation protection.   ]
				Slog{chance:?}[ Land dotted with tar pits. Dangerous chemicals are plentifull here. creatures that spew toxic gas. boulders and dead trees make good shade. caustic gass leaks from the ground.    ]
			)
		
		
		)	
			
		warm[5](	
			
			Shrindo{chance:?}[ Pillars of salt tower around a dried up lake bed. the ground is mostly flat and only disturbed by the cracking and flaking of the dirt. squirpions inhabit this land.  ]
			Rindge{chance:?}[ The harsh landscape of stone rubble laid out before you Will most likely be difficult to traverse withought shoes of a favorably strong quality. Unrelenting sun bares down on the ground while forcing the water in the small cracks down below to utter sizzling and cracking sounds. With some luck you may be able to avoid the creatures Whose bodies are composed of stone.    ]
			Bala Nin{chance:?}[ Arches and pillars, accompanied by many other shapes, of sandstone dot, rather densely, a desert of sand. Dark figures tent to lurk in the passing shade of these ominous structures. The Figures eccentric rambling can be heard in wispers.  ]
			Smern{chance:?}[ The sand is stained black that slowly creeps through each space between the sand grains. deadly pits of tar occasionally form occasionally.  ]
			Fwinfawn{chance:?}[ volcanically active charred lands where lava still flows and the the sun is hot. a good source of (insert goddes's name here)'s Hair(to ben of science these strands are merely streched volcanic glass cooled in the wind, to mages they are a prised magical material)    ]
			Badlands{chance:?}[ Savage and hosile lands where spycoticly violent tribes of murderers wage wars of death and destruction apo0n eachother. What makes it even worse are the scorchingly hot days and cold nights.   ]
		)
		
	)
	
	
	random ( water, land)\|/
	Water ( Random { [Frozenlake If Surrounding tiles are either Cold type or ColdToTempoateTransition 3 type]      })
	land ( Random {   })
	
	
	wetlands or shore
	lake
	wetlands or shore
	
	
	
*/	
Return


_DisplayCoordinates:
	DisplayCoordinates = 0
	if DisplayCoordinates = 1 //placeholder to make sure that coords are not displaying 
		CreateText (6, "x" + Str(CurrentX) + "Y" + Str(CurrentY) )
		SetTextPosition ( 6, 600, 10)
		SetTextSize ( 6, 35)
		SetTextAlignment( 6, 2 )
		
		
		Gosub _BiomeDecoder
		
		CreateText (7, "Biome: " + "pie must be removed")
		SetTextPosition ( 7, 580, 35)
		SetTextSize ( 7, 20)
		SetTextAlignment( 7, 2 )
	endif
Return


/* failed attempt at making a sprite placement system 
Function SpriteSnap(SpriteSnapSprite1, SpriteSnapSprite2, ConnectionPoint1, ConnectionPoint2)
	
	
	
	Connection points: 123
					   8 4										
					   765
					   
	
			Dim SpriteSnapCPS[8,8]
		
		For SpriteSnapCounter1= 0 to 8// start a loop that starts all slots with 0
			For SpriteSnapCounter2= 0 to 8
				SpriteSnapCPS[SpriteSnapCounter1, SpriteSnapCounter2] =0
			Next SpriteSnapCounter2	
		Next SpriteSnapCounter1
	
	
	
	
	
	
			
		SpriteSnapWidth  = GetSpriteWidth	 ( SpriteSnapSprite1 ) 
		SpriteSnapHeight = GetSpriteHeight   ( SpriteSnapSprite1 ) 
		SpriteSnapX      = GetSpriteXByOffset( SpriteSnapSprite1 )
		SpriteSnapY      = GetSpriteYByOffset( SpriteSnapSprite1 )
				SpriteSnapMiddleRightX   = SpriteSnapX  + SpriteSnapWidth / 2
				SpriteSnapMiddleRightY   = SpriteSnapY 
										
				SpriteSnapMiddleLeftX    = SpriteSnapX  - SpriteSnapWidth / 2
				SpriteSnapMiddleLeftY    = SpriteSnapY
										
				SpriteSnapTopRightX 	 = SpriteSnapMiddleRightX
				SpriteSnapTopRightY	     = SpriteSnapMiddleTopY
										
				SpriteSnapTopLeftX   	 = SpriteSnapMiddleLeftX
				SpriteSnapTopLeftY	     = SpriteSnapMiddleTopY
										
				SpriteSnapMiddleTopX     = SpriteSnapX 
				SpriteSnapMiddleTopY     = SpriteSnapY + SpriteSnapHeight / 2
										
				SpriteSnapMiddleBottomX  = SpriteSnapX 
				SpriteSnapMiddleBottomY  = SpriteSnapY - SpriteSnapHeight / 2
										
				SpriteSnapBottomRightX 	 = SpriteSnapMiddleRightX
				SpriteSnapBottomRightY   = SpriteSnapMiddleBottomY
										
				SpriteSnapBottomLeftX    = SpriteSnapMiddleLeftX
				SpriteSnapBottomLeftY	 = SpriteSnapMiddleBottomY
				
		SpriteSnapWidth2  = GetSpriteWidth	 ( SpriteSnapSprite2 ) 
		SpriteSnapHeight2 = GetSpriteHeight   ( SpriteSnapSprite2 ) 
		SpriteSnap2X      = GetSpriteXByOffset( SpriteSnapSprite2 )
		SpriteSnap2Y      = GetSpriteYByOffset( SpriteSnapSprite2 )
				SpriteSnapMiddleRight2X  = SpriteSnap2X  + SpriteSnapWidth2 / 2
				SpriteSnapMiddleRight2Y  = SpriteSnap2Y 
										
				SpriteSnapMiddleLeft2X   = SpriteSnap2X  - SpriteSnapWidth / 2
				SpriteSnapMiddleLeft2Y   = SpriteSnap2Y
										
				SpriteSnapTopRight2X 	 = SpriteSnapMiddleRight2X
				SpriteSnapTopRight2Y	 = SpriteSnapMiddleTop2Y
										
				SpriteSnapTopLeft2X   	 = SpriteSnapMiddleLeft2X
				SpriteSnapTopLeft2Y	     = SpriteSnapMiddleTop2Y
										
				SpriteSnapMiddleTop2X     = SpriteSnap2X 
				SpriteSnapMiddleTop2Y     = SpriteSnap2Y + SpriteSnapHeight2 / 2
										
				SpriteSnapMiddleBottom2X  = SpriteSnap2X 
				SpriteSnapMiddleBottom2Y  = SpriteSnap2Y - SpriteSnapHeight2 / 2
										
				SpriteSnapBottomRight2X   = SpriteSnapMiddleRight2X
				SpriteSnapBottomRight2Y   = SpriteSnapMiddleBottom2Y
										
				SpriteSnapBottomLeft2X    = SpriteSnapMiddleLeft2X
				SpriteSnapBottomLeft2Y	  = SpriteSnapMiddleBottom2Y
				
							
							  If ConnectionPoint1 = 1 and ConnectionPoint2 = 5 
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapTopLeftX + SpriteSnapWidth2 / 2 , SpriteSnapMiddleTopY + SpriteSnapHeight2 / 2  )
								
							  Endif
							  
							  If ConnectionPoint1 = 2 and ConnectionPoint2 = 6
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapMiddleTopX + SpriteSnapWidth2 / 2 , SpriteSnapMiddleTopY + SpriteSnapHeight2 / 2  )
														  
							  Endif
							 
							  If ConnectionPoint1 = 3 and ConnectionPoint2 = 7
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapMiddleTopY + SpriteSnapHeight2 / 2  )
												
							  endif
								
							  If ConnectionPoint1 = 3 and ConnectionPoint2 = 1
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapTopRightY - SpriteSnapHeight2 / 2  )
														
							  endif
							  
							  If ConnectionPoint1 = 8 and ConnectionPoint2 = 5
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapBottomRightY - SpriteSnapHeight2 / 2  )
															 
							  endif
							  
							  If ConnectionPoint1 = 7 and ConnectionPoint2 = 5
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapBottomRightY + SpriteSnapHeight2 / 2  )
								
							  endif
							  
							  If ConnectionPoint1 = 7 and ConnectionPoint2 = 4
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapTopLeftX - SpriteSnapWidth2 / 2 , SpriteSnapBottomLeftY)
														 
							  endif
							  
							  If ConnectionPoint1 = 6 and ConnectionPoint2 = 2
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapMiddleBottomX , SpriteSnapMiddleBottom2Y - SpriteSnapHeight2 / 2     )
							  endif
							  
							  If ConnectionPoint1 = 7 and ConnectionPoint2 = 2
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapBottomRightX , SpriteSnapMiddleBottom2Y - SpriteSnapHeight2 / 2     )
														  
							  endif
							  
							  If ConnectionPoint1 = 7 and ConnectionPoint2 = 3
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapBottomRightX - SpriteSnapWidth2 / 2 , SpriteSnapMiddleBottom2Y - SpriteSnapHeight2 / 2     )
														 
							  endif
							  
							  If ConnectionPoint1 = 5 and ConnectionPoint2 = 2
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapBottomLeftX , SpriteSnapMiddleBottom2Y - SpriteSnapHeight2 / 2     )
														  
							  endif
							  
							  If ConnectionPoint1 = 5 and ConnectionPoint2 = 1
								SetSpritePositionByOffset(SpriteSnapSprite2,SpriteSnapBottomLeftX + SpriteSnapWidth2 / 2 , SpriteSnapMiddleBottom2Y - SpriteSnapHeight2 / 2     )
															  
							  endif
							  
							  If ConnectionPoint1 = 3 and ConnectionPoint2 = 8
								SetSpritePositionByOffset(SpriteSnapSprite2, SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapTopRightY )
														 
							  endif
							  
							  If ConnectionPoint1 = 3 and ConnectionPoint2 = 1
								SetSpritePositionByOffset(SpriteSnapSprite2, SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapTopRightY - SpriteSnapHeight2 / 2 )
								Do	
									Print("itworks")
									sync()
									
								Loop					 
							  endif
							  
							  If ConnectionPoint1 = 4 and ConnectionPoint2 = 1
								SetSpritePositionByOffset(SpriteSnapSprite2, SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapMiddleRightY + SpriteSnapHeight2 / 2 )
														 
							  endif
							  
							  If ConnectionPoint1 = 5 and ConnectionPoint2 = 1
								SetSpritePositionByOffset(SpriteSnapSprite2, SpriteSnapTopRightX + SpriteSnapWidth2 / 2 , SpriteSnapBottomRightY + SpriteSnapHeight2 / 2 )
															 
							  endif
	
EndFunction  //ends function and outputs the value of the Total Variable
*/


