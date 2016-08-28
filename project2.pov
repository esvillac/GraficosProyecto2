

global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }}
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
  location  <0.0 , 3.0 ,-5.0>
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
    object{Segment1 rotate <0,20+ 20*clock,0>}
    object{Segment1 rotate <0,40+ 40*clock,0>}
    object{Segment1 rotate <0, 60+ 60*clock,0>}
    object{Segment1 rotate <0, 80+80*clock,0>}
    object{Segment1 rotate <0,100+100*clock,0>}
    object{Segment1 rotate <0,120+120*clock,0>}
    object{Segment1 rotate <0,140+140*clock,0>}
    object{Segment1 rotate <0,160+160*clock,0>}
    object{Segment1 rotate <0,180+180*clock,0>}
    object{Segment1 rotate <0,200+ 200*clock,0>}
    object{Segment1 rotate <0,220+ 220*clock,0>}
    object{Segment1 rotate <0,240+ 240*clock,0>}
    object{Segment1 rotate <0,260+ 260*clock,0>}
    object{Segment1 rotate <0,280+ 280*clock,0>}
    object{Segment1 rotate <0,300+300*clock,0>}
    object{Segment1 rotate <0,320+320*clock,0>}
    object{Segment1 rotate <0,340+340*clock,0>}
    object{Segment1 rotate <0,360+360*clock,0>}
  } // end of union
#end // ------------------ end of worm's macro

// coordinates for the points of a spline
#declare P1 = <-2.00, 1, -2.00>;
#declare P2 = < 1.00, 1, -2.00>;
#declare P3 = < 2.00, 1, -1.00>;
#declare P4 = < 2.00, 1,  2.00>;
#declare P5 = < 0.00, 1,  2.00>;
#declare P6 = <-2.00, 1,  1.50>;
#declare P7 = <-2.00, 1, -1.00>;
#declare P8 = <-2.00, 1, -2.00>;

#declare Spline_1 =
  spline {
    natural_spline
    -0.250, P7, // control point
    0.000, P1, // starting point
    0.125, P2,
    0.250, P3,
    0.420, P4,
    0.490, P5,
    0.780, P6,
    0.900, P7,
    1.000, P1, // end point
    1.125, P2  // control point
  }// end of spline ---------------
/* Drawing the worm*/
object{
  Worm(0.15, 0.50, Segment_Texture)
  translate Spline_1(clock+0/30)}
// -------------------------------- end

// message of pov ray.
object{ Circle_Text_Valigned(
  "cyrvetic.ttf" // or: "arial.ttf", // Font,
  "POV-RAY", //  Text,
  0.35,  0.0005, 0.15,  // Letter_Size, Letter_Spacing, Deepth,
  1.00,     1,         // Radius, Inverted,
  Align_Center, // Justification: either Align_Left, Align_Right, or Align_Center
  15,        // Circle angle
  -95 )      // Valign:  Rotates vertical objects. -90 = right side up, 90 = upside-down, 0 = horzontal.

  texture{ pigment{ color rgb<1,0.75,0>}
    // normal { bumps 0.5 scale 0.005}
    finish { specular 1 reflection { 0.15 metallic 0.25} }
  } // end of texture
  rotate<90,100,0>
  scale<1,2,1>*1
  translate<0,0.5,10>
} // end povray message  ------------------------------------------------------------

// // spline used to move worm
// #declare P1 = <-2.00, 0.20, -2.00>;
// #declare P2 = < 1.00, 0.20, -2.00>;
// #declare P3 = < 2.00, 0.70, -1.00>;
// #declare P4 = < 2.00, 1.20,  2.00>;
// #declare P5 = < 0.00, 0.20,  2.00>;
// #declare P6 = <-2.00, 3.20,  1.50>;
// #declare P7 = <-2.00, 0.70, -1.00>;
// #declare P8 = <-2.00, 0.00, -2.00>;

//----------------------------------------


// The moving sphere:
sphere{ <0,0,0>,0.5
  texture{ pigment{ rgb<1.0,1.0,1>*0.05 }
    finish { phong 1 reflection{ 0.1 metallic 0.25} }
  }
  translate<0,0.5,0>
  translate Spline_1(clock+0/30)

} // end of sphere
//---------------------------------------