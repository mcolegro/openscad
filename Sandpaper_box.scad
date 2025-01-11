$fa = 1;
$fs = 0.4;


/* [Box dimension] */
box_width=200;
box_depth=124;
box_height=130;
wall_width=2; //[1:0.1:5]
drill_hole=5;
grip_hole=true;
grip_hole_radius=50;

/* [Pattern config] */
pattern_enable=true;
pattern_radius=5;
pattern_distance=2;
pattern_border_distance=5;

/* [Font config] */
// comma seperated list, for each element one seperator will be created
front_text="60,80,100,120,150,180,240,320,400,600";
front_text_size=6;
front_text_inverted=true;

/* [hidden] */
front_height=box_height/3;
parts = get_parts(front_text, ",");
x_step = box_width / len(parts);


rotate(a=90, v=[1, 0, 0])
create_sandpaper_box();
//create_shape(box_width, box_depth, box_height);

module create_sandpaper_box(){ 
   if ( front_text_inverted )
      difference(){
         create_frame();
      
         translate([1, 0, 0])
         for( i = [0:len(parts)] ) #create_text(i);
      }
   else{
      create_frame();
      color("Red")
      for( i = [0:len(parts)] ) create_text(i);
      }

   for( i = [0:len(parts)] )create_seperator(i);
}

module create_frame(){
   difference() {
      create_shape(box_width, box_depth, box_height);

      translate([wall_width, wall_width, wall_width])
      create_shape(box_width-2*wall_width, box_depth-2*wall_width, box_height*2, false);
  
      create_drill_hole( box_depth-wall_width*2.5, box_height-15, x_step/2 );
      create_drill_hole( box_depth-wall_width*2.5, box_height-15, box_width-x_step/2 );
   }
}

module create_shape(width, depth, height, b_hole=true){ 
  linear_extrude(width)
  
  if ( b_hole && pattern_enable ) 
    add_pattern(depth, height){ create_polygon(depth, height, b_hole); }
  else create_polygon(depth, height, b_hole);
}  
 
module add_pattern( depth, height ){ 
  border=pattern_border_distance;
  
  difference(){
    children();

    intersection(){
      create_hexagon_holes( depth, height );
      offset(delta=-border)
        children();
    }
  }
}

module create_polygon(depth, height, b_hole=true){
  round=5;
  
  translate([round,round,0])
    minkowski() {
      difference() {
        polygon([[0,0],[depth-round*2,0],[depth-round*2,height-round*2],[depth-10-round*2,height-round*2],[0,front_height-round*2]]);  
        
        if ( b_hole && grip_hole ) {
          translate([box_depth/2.5, box_height-box_height/4, 0]) 
          circle(r=grip_hole_radius);
        }
      }  
      circle(round);
    }
}

module create_hexagon_holes( w, h ){
   d=pattern_radius*2;
   o=pattern_distance;
   w_count = w / d*2;
   h_count = h / d*3;
  
   for ( ih = [0:h_count] )
      for ( i = [0:w_count] ){ 
         x =  i * (d+o*2+d/3) + o + ((ih%2==0)? 0 : d*2/3 + o);
         y = ih * (d/2 + o/2) + o;
         translate([x, y, 0]) 
         circle(r=d/2, $fn=6);
      }
}
module create_drill_hole( x, y, z ){
   translate( [ x + wall_width, y, z ] )
   rotate(a=90, v=[0, 1, 0])
   cylinder(wall_width*3, r=drill_hole/2, true, $fn=30);
}

module create_seperator( i ){
   if ( i != 0 && i != len(parts) )
      translate([0, 0, i * x_step])
      create_shape(wall_width, box_depth, box_height);
}

module create_text( i ){
  x = (i * x_step) + (x_step*0.5);
  y = front_height-front_height/4;
  z = 0;
  height = 1;

  rotate(a=90, v=[0, -1, 0])
  translate([x, y, z])
  linear_extrude(height) text(parts[i], front_text_size, "Lora:style=Medium", halign="center");
}
  
function substr(string, start, length) = start < length ? str(string[start], substr(string, start + 1, length)) : "";

function get_parts( string, sep ) =
  let( parts = search(sep, front_text, num_returns_per_match = 0)[0] )
  concat( [for( i = [0:len(parts)] ) 
      let(i_start = i == 0? 0 : parts[i-1] + 1, 
          i_end = i == len( parts )? len(front_text) : parts[i] )
      substr( front_text, i_start, i_end ) ] );




