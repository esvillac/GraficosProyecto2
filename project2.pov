global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }}
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes3.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
  location  <0.0 , 3.0 ,-8.0>
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
}// end of sky

// TEXTURAS
#declare Segment_Texture =
  texture{ pigment{ bozo}
    finish { phong 1.0 }
  }

#declare Segment_Texture2 =
  texture { pigment{ agate}
  }

#declare Segment_Texture3 =
  texture { Polished_Chrome
  }

#declare esfera_texture =
  texture{ pigment{ granite}
    finish { phong 1.0 }
  }

#declare esfera_texture2 =
  texture { pigment{ wood}
    finish { phong 1.0 }
  }

#declare esfera_texture3 =
  texture { Polished_Chrome
  }

#declare box_Material =
  material{
    texture { pigment{ color rgbt <0, 1, 0, 1>}
      finish{
        ambient 0
        diffuse 0
        reflection {
          0, 1
          fresnel on
        }
        conserve_energy
      }}
    interior {
      ior 1.3
    }
  }


#declare box_texture  =



       texture{ White_Wood  
                normal { wood 0.5 scale 0.3 turbulence 0.1}
                finish { phong 1 } 
                rotate<60,0,45> scale 0.2
              } // end of texture 

         



#declare box_texture2 =
   texture { pigment{ color rgb<1,1,1>*0.15}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture
     
 

#declare box_texture3 = 
          texture { Polished_Chrome
                   pigment{ color rgb<0.5,0.3,0.8>} 
                   normal { crackle 3  scale 0.15 } 
                   // finish { phong 1}
                 } // end of texture 

 
 
    
 
 
 
#declare torus_texture =
  texture { pigment{ radial rotate -x*90 }
    finish { phong 0.4 }
  }            
  

#declare torus_texture2 =
  texture { pigment{ mandel 256}
  }

#declare torus_texture3 =
  texture { pigment{ checker }
    finish { phong 0.4 }
  } // end of texture
// END TEXTURAS

// SPLINES
// coordinates for the points of a spline
#declare P1 = <-2.00, 1, -2.00>;
#declare P2 = < 1.00, 1, -2.00>;
#declare P3 = < 2.00, 1, -1.00>;
#declare P4 = < 2.00, 1,  2.00>;
#declare P5 = < 0.00, 1,  2.00>;
#declare P6 = <-2.00, 1,  1.50>;
#declare P7 = <-2.00, 1, -1.00>;
#declare P8 = <-2.00, 1, -2.00>;

#declare Spline_tacho_basura =
  spline {
    natural_spline
    -0.150, P7, // control point
    0.300, P1, // starting point
    0.225, P2,
    0.350, P3,
    0.440, P4,
    0.590, P5,
    0.880, P6,
    1.130, P7,
    1.200, P1, // end point
    1.325, P2  // control point
  }// end of spline ---------------

#declare Spline_esfera =
  spline {
    natural_spline
    -0.350, P7 - 0.05, // control point
    0.300, P1 -0.05, // starting point
    0.125, P2 -0.05,
    0.250, P3 -0.05,
    0.420, P4 -0.05,
    0.490, P5 -0.05,
    0.780, P6 -0.05,
    0.900, P7 -0.05,
    1.000, P1 -0.05, // end point
    1.125, P2 -0.05  // control point
  }// end of spline ---------------


#declare Spline_box =
  spline {
    natural_spline
    -0.250, P7 - 0.10, // control point
    0.400, P1 -0.15, // starting point
    0.125, P2 -0.15,
    0.250, P3 -0.05,
    0.420, P4 -0.15,
    0.490, P5 -0.15,
    0.780, P6 -0.15,
    0.900, P7 -0.15,
    1.000, P1 -0.15, // end point
    1.125, P2 -0.15  // control point
  }// end of spline ---------------

#declare Spline_torus =
  spline {
    natural_spline
    -0.250, P7 + 0.20, // control point
    0.000, P1 +0.25, // starting point
    0.125, P2 +0.25,
    0.250, P3 +0.25,
    0.420, P4 +0.35,
    0.490, P5 +0.45,
    0.780, P6 +0.45,
    0.900, P7 +0.45,
    1.000, P1 +0.45, // end point
    1.125, P2 +0.35  // control point
  }// end of spline ---------------

//END SPLINES

// Create a plane
polygon {
  5,
  <-10,0,10>, <-10,0,-10>, <10,0,-10>, <10,0,10>, <-10,0,10>
  #if (frame_number <200)
    texture {
      pigment {
        checker White Tan
        scale 0.4
      }
      finish {
        diffuse 0.9
      }
    }
  #elseif (frame_number>200)
        texture {
      pigment {
        checker Black Tan
        scale 0.4
      }
      finish {
        diffuse 0.9
      }
    }
  #end
}

//ground floor
fog { fog_type   2
  distance   50
  color      rgb<1,1,1>*0.8
  fog_offset 0.1
  fog_alt    1.5
  turbulence 1.8
} //
// ground ----------------------------------
plane{ <0,0.25,0>, -0.1
  texture{
    pigment{ color rgb<0.22,0.45,0>}
    normal { bumps 0.75 scale 0.015 }
    finish { phong 0.1 }
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
//sphere macro
#macro Esfera (Texture)
  sphere { <0,0,0>, 0.75
    texture { Texture
    } // end of texture

    scale<0.3,0.3,0.3>  rotate < 0,360*clock,0>  translate<1.55*clock,1.35,0>
  }
#end // end of sphere macro -----------------------------------

//torus macro
#macro Torus (Texture)
  torus { 0.35,0.15
    texture { Texture}
    scale <0.6,0.6,0.6> rotate<90,360*clock,0> translate<0,0.60,0>
  }
#end
// end of torus macro  -------------------------------

//box macro
#macro Box (Texture)
  box { <0,0,0>,< 1.00, 1.00, 1.00>
   texture { Texture}
    scale <0.5,0.5,0.5>
    rotate< 0,360*clock,0> translate<0.2,1.2,0>
  }
#end
//end of box macro

/* Declaration of worm components*/
#declare Position_1 =  <0,0.25,1> ;


/*macro used to create the worm*/
#macro Worm (radius_segment, radius_ring, Texture)
  #local Segment1 =
  sphere{ <radius_ring,0,0>,radius_segment
    texture{Texture}}

  union{

    // lapiz
    object{
      cylinder {
        <0.1,-2,-0.2>, // start
        <0.3,0.5,0.2>, // end
        0.1         // Radius
        open           // Remove end caps
        texture { Polished_Chrome }
      }
    }
    //envase
    object {
      Round_Cylinder_Tube(
        <0.1,-2,-0.2>, // start
        <0.1,-0.8,-0.2>, // end
        0.3, // major radius
        0.03, // border radius
        0, //  1 = filled; 0 = open
        0  //  Merge_On,
      ) // ------------------------------
      texture{ pigment{ color rgb<1,1,1>}
        finish { phong 0.1}
      } // end texture
      scale <1,1,1>
      rotate <0,0,0>
      translate < 0, 0.9, 0>
    } // end of object
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

/*Drawing the sphere*/
#if (frame_number<100)
  object{
    Esfera(esfera_texture3)
    translate Spline_esfera(clock+0/30)}
  // -------------------------------- end
  #elseif (frame_number>=100 & frame_number<200)
  object{
    Esfera(esfera_texture2)
    translate Spline_esfera(clock+0/30)}
  #elseif (frame_number>=200)
  object{
    Esfera(esfera_texture3)
    translate Spline_esfera(clock+0/30)}
#end
//end draw sphere.

/* Drawing the torus*/
#if (frame_number<100)
  object{
    Torus(torus_texture)
    translate Spline_torus(clock+0/30)}
  // -------------------------------- end
  #elseif (frame_number>=100 & frame_number<200)
  object{
    Torus(torus_texture2)
    translate Spline_torus(clock+0/30)}
  #elseif (frame_number>=200)
  object{
    Torus(torus_texture3)
    translate Spline_torus(clock+0/30)}
#end
//end draw torus

/* Drawing the box*/
#if (frame_number<100)
  object{
    Box(box_texture)
    translate Spline_box(clock+0/30)}
  // -------------------------------- end
  #elseif (frame_number>=100 & frame_number<300)
  object{
    Box(box_texture2)
    translate Spline_box(clock+0/30)}
  #elseif (frame_number>=300)
  object{
    Box(box_texture3)
    translate Spline_box(clock+0/30)}
#end
//end draw box

/* Drawing the custom object*/
#if (frame_number<100)
  object{
    Worm(0.15, 0.50, Segment_Texture)
    translate Spline_tacho_basura(clock+0/30)}
  // -------------------------------- end
  #elseif (frame_number>=100 & frame_number<200)
  object{
    Worm(0.15, 0.50, Segment_Texture2)
    translate Spline_tacho_basura(clock+0/30)}
  #elseif (frame_number>=200)
  object{
    Worm(0.15, 0.50, Segment_Texture3)
    translate Spline_tacho_basura(clock+0/30)}
#end

// message of pov ray.
difference {
  box{
    <-3,-2, 8>, <4, 2, 8>
    texture{
      pigment{ brick
        color White
        color rgb<0.8,0.25,0.1>
        // color mortar, color brick
        brick_size <0.25, 0.0525, 0.125 >
        // format in x-,y-,z- direction
        mortar 0.01 // size of the mortar
      }
      normal { wrinkles 0.75 scale 0.01}
      finish { diffuse 0.9 phong 0.2}
    } // end of texture
  }
  text {
    ttf "timrom.ttf" " POV-RAY RLZ!" 0.15, 0
    pigment {
      bozo
      frequency 3            // <- add this line
      color_map {
        [0.00 color Red]
        [0.33 color Blue]
        [0.66 color Yellow]
        [1.00 color Red]
      }
      rotate -45*z
    }
    finish { reflection .25 specular 1 }
    translate <-3,1,8>
  }
}
// end povray message  ------------------------------------------------------------


#declare p1 = <1,0,0>;
#declare p2 = <0,1,0>;
#declare p3 = <-1,0,0>;
#declare p4 = <0,-1,0>;
#declare p5 = <0,0,1>;

//Define the polygons for each of the five sides.
//Notice that the last point must be a repetition of the first.
//The first number indicates how many points will be listed.
#declare f1 = polygon { 5, p1, p2, p4, p3, p1 };
#declare f2 = polygon { 4, p1, p2, p5, p1 };
#declare f3 = polygon { 4, p2, p3, p5, p2 };
#declare f4 = polygon { 4, p3, p4, p5, p3 };
#declare f5 = polygon { 4, p4, p1, p5, p4 };

//Define the pyramid to be the union of its faces.
#declare mypyramid = object { union {
  object{f1}
  object{f2}
  object{f3}
  object{f4}
  object{f5}
}
  texture{ pigment{ granite}
    finish { phong 1.0 }
  }

  rotate <0,90,90>
  translate <1.5,1,4>
  rotate <0, 360*clock,0>
};

//List the defined object(s) to be displayed
mypyramid
