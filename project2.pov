

global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
// sun ----------------------------------------------------------------------
light_source{< 3000,3000,-3000> color White}
// sky ----------------------------------------------------------------------
plane{<0,1,0>,1 hollow
       texture{
        pigment{ bozo turbulence 0.92
          color_map {
           [0.00 rgb <0.2, 0.3, 1>*0.5]
           [0.50 rgb <0.2, 0.3, 1>*0.8]
           [0.70 rgb <1,1,1>]
           [0.85 rgb <0.25,0.25,0.25>]
           [1.0 rgb <0.5,0.5,0.5>]}
          scale<1,1,1.5>*2.5
          translate<1.0,0,-1>
          }// end of pigment
        finish {ambient 1 diffuse 0}
        }// end of texture
        scale 20000
     }// end of plane
//--------------------------------------------------------------------------
//Piso -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}
              //normal { bumps 0.75 scale 0.025}
                finish { phong 0.1}
              } // end of texture
     } // end of plane

//-------------------------------------------------------------------------- 
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------

#declare Ray_Profile = 
box { <-1,-1,-1>,< 1,1,1> 
       scale <1,1,1>*sqrt(2) 

      texture { pigment{ color rgb<0.5,1.0,0.0>*1.0}  
                finish { phong 1}
              } // end of texture
       rotate<0,0,45>
       scale <1,0.36,1> 
       rotate< 45,0,0>
    } // end of box ---------------------------------------
 

#declare Ray =
intersection{
object{ Ray_Profile }  
object{ Ray_Profile scale<1,1,-1>}  
box{ <-2,-1,-1>,<0,1,1> 
     texture { pigment{ color rgb<1,0.0,0.3>}  
               finish { phong  1}
             } // end of texture
    inverse   
   }// end of box
scale<1,0.5,0.5>
}

//----------------------------------------------------------



union{
 #local Nr = 0;     // start
 #local EndNr = 6;  // end
 #while (Nr< EndNr) 
   object{Ray  rotate<0,Nr * 360/EndNr,0>} 

 #local Nr = Nr + 1;// next Nr
 #end // ------------- end of loop  
 
 scale <0.3,0.3,0.3> rotate<90,360*clock,0> translate<-1.20,1.2,0> } // end of union

//------------------------------------------------------- end    

// sample sphere
sphere { <0,0,0>, 0.75 
         texture { Polished_Chrome
                   //pigment{ color Red } // rgb< 1, 0.0, 0.0>}
                   //finish { phong 1 reflection {0.40 metallic 0.5}}
                 } // end of texture 

          scale<0.3,0.3,0.3>  rotate < 0,360*clock,0>  translate<1.55,1.35,0>  
       }
// end of sphere ----------------------------------- 


torus { 0.35,0.15 
        texture { pigment{ color rgb<1,1,1>*0.15 }
                  finish { phong 0.4 }
                } // end of texture
        scale <0.6,0.6,0.6> rotate<90,360*clock,0> translate<0,0.60,0>
} 
// end of torus  -------------------------------         


box { <0,0,0>,< 1.00, 1.00, 1.00>   

      texture { pigment{ color rgb<1,1,1>*0.15}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale <0.5,0.5,0.5>
      rotate< 0,360*clock,0> translate<0.2,1.2,0> 
    } // end of box -          
    

/* Declaration of worm components*/
#declare Position_1 =  <0,0.25,1> ;
#declare Segment_Texture =
 texture{ pigment{ color rgb<1,0.65,0>}
          finish { phong 1.0 }
        } // end of texture

/*macro used to create the worm*/
#macro Worm (radius_segment, radius_ring, Texture)
#local Segment1 =
 sphere{ <radius_ring,0,0>,radius_segment
         texture{Texture}}

union{
  object{Segment1 rotate <0,  0,0>}
  object{Segment1 rotate <0, 20,0>}
  object{Segment1 rotate <0, 40,0>}
  object{Segment1 rotate <0, 60,0>}
  object{Segment1 rotate <0, 80,0>}
  object{Segment1 rotate <0,100,0>}
  object{Segment1 rotate <0,120,0>}
  object{Segment1 rotate <0,140,0>}
  object{Segment1 rotate <0,160,0>}
  object{Segment1 rotate <0,180,0>}
 } // end of union
#end // ------------------ end of worm's macro
/* Drawing the worm*/
object{
  Worm(0.15, 0.50, Segment_Texture)
  translate<2,0.25,1>}
// -------------------------------- end 