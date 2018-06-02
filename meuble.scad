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

color([0.42,0.09,0.09]) {
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

//placement matos
translate([3,5,hauteur_caisson_vinyle + epaisseur_bois*2]) platine();
translate([largeur_plateau_bas+epaisseur_bois+espace_hifi,0,epaisseur_bois]) hifi();
translate([largeur_plateau_bas+(epaisseur_bois*2)+largeur_caisson+espace_pc,0,epaisseur_bois]) pc();
