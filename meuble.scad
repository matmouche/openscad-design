largeur = 160;
hauteur = 50;
profondeur = 45;
epaisseur_bois = 3;
epaisseur_caisson = 2;
largeur_caisson = 55;
largeur_plateau_haut = (largeur_caisson*2)+(epaisseur_caisson*2)+epaisseur_bois;
largeur_plateau_bas = largeur - largeur_plateau_haut;
hauteur_caisson_vinyle = 35;
hauteur_caisson_hifi = (hauteur / 2)  - (epaisseur_caisson / 2);
espace_hifi = (largeur_caisson - 43.5) / 2;
espace_pc = (largeur_caisson - 44) / 2;
espace_enceinte_centrale = (largeur_caisson - 36) / 2;
espace_decodeur = (largeur_caisson - 17) / 2;
espace_tv = (largeur - 94) / 2;
espace_new_tv = (largeur - 123) / 2;

module platine() {
    color("black") {
        cube([35.5,33,9]);
    }
}

module hifi() {
    color("black") {
        cube([43.5,29,17]);
    }
}

module pc() {
    color("black") {
        cube([44,36,17.25]);
    }
}

module enceinte_centrale() {
    color("black") cube([36,0.5,13]);
    color([0.42,0.09,0.09]) translate([0,0.5,0]) cube([36,12.5,13]);    
}

module enceinte_laterale() {
    color("black") translate([0,0,31]) cube([21.5,0.5,54.5]);
    color([0.42,0.09,0.09]) translate([0,0.5,0]) cube([21.5,24,85.5]);
}

module decodeur() {
    color("black") cube([17,14,4]);
}

module tv() {
    color("grey") cube([94,3,56]);
} 

module new_tv() {
    color("black") cube([123,3,76.6]);
}

module vinyle() {
 color("red") cube([0.5,31.5,31.5]);
}

color([56/255,62/255,66/255]) {
    //plancher
    cube([largeur,profondeur,epaisseur_bois]);
    
    //côtés;
    cube([epaisseur_bois, profondeur, hauteur_caisson_vinyle + epaisseur_bois]);
    translate([largeur-epaisseur_bois,0,0]) cube([epaisseur_bois, profondeur, hauteur]);
    
    //plateaux
    translate([largeur - largeur_plateau_haut ,0,hauteur-epaisseur_bois]) cube([largeur_plateau_haut,profondeur,epaisseur_bois]);
    translate([0,0,hauteur_caisson_vinyle+epaisseur_bois]) cube([largeur_plateau_bas,profondeur,epaisseur_bois]);
    translate([largeur - largeur_plateau_haut ,0,hauteur_caisson_hifi+epaisseur_bois]) cube([largeur_plateau_haut,profondeur,epaisseur_caisson]);
	
    //caissons
    translate([largeur - epaisseur_caisson - epaisseur_bois - largeur_caisson, 0,0]) cube([epaisseur_caisson, profondeur, hauteur]);
    translate([largeur - (epaisseur_caisson*2) - epaisseur_bois - (largeur_caisson*2), 0,0]) cube([epaisseur_caisson, profondeur, hauteur]);
	
}

//mur
translate([-30,profondeur+3,0]) color("white") cube([220,5,200]);

//placement matos
translate([3,5,hauteur_caisson_vinyle + epaisseur_bois*2]) platine();
translate([largeur_plateau_bas+epaisseur_bois+espace_hifi,0,epaisseur_bois]) hifi();
translate([largeur_plateau_bas+epaisseur_bois+espace_enceinte_centrale,0,epaisseur_bois+epaisseur_caisson+hauteur_caisson_hifi]) enceinte_centrale();
translate([-22,0,0]) enceinte_laterale();
translate([largeur+0.5,0,0]) enceinte_laterale();
translate([largeur_plateau_bas+(epaisseur_bois*2)+largeur_caisson+espace_pc,0,epaisseur_bois]) pc();
translate([largeur_plateau_bas+(epaisseur_bois*2)+largeur_caisson+espace_decodeur,0,epaisseur_bois+epaisseur_caisson+hauteur_caisson_hifi]) decodeur();
translate([espace_tv,profondeur-0.01,hauteur+5]) tv();
translate([espace_new_tv,profondeur,hauteur+5]) new_tv();

//placement vinyles
for (i =[0:15]) translate([8.5+i,0,epaisseur_bois]) rotate([0,-10,0]) vinyle();
for (i =[0:5]) translate([32+i,0,epaisseur_bois]) rotate([0,10,0]) vinyle();
