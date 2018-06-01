largeur = 160;
hauteur = 50;
profondeur = 45;
epaisseur_bois = 3;
color("red") {
    //plancher
    cube([largeur,profondeur,epaisseur_bois]);
    
    //côtés;
    cube([epaisseur_bois, profondeur, hauteur]);
    translate([largeur-epaisseur_bois,0,0]) cube([epaisseur_bois, profondeur, hauteur]);
    
    //plateau
    translate([0,0,hauteur-epaisseur_bois]) cube([largeur,profondeur,epaisseur_bois]);
    
    
}
