size(400, 400);
color mycolor = color(120, 100, 204);
loadPixels();
for (int i = 0; i < (width*height)-width; i++) {
  pixels[i] = mycolor;

  //alter color values to create gradient
  //pixels[i] = color(map(i,0,width*height,0,255),100,204);
}
updatePixels();
