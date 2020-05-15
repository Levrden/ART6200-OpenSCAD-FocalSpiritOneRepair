/*Pièce femelle pour réparation d'arceau de casque focale Spirit One.
Un bon casque que j'ai acheté il y a un moment et qui s'est rapidement cassé, sans prise en charge de la garantie. 
J'ai déjà essayé de le réparer à l'imprimante 3D mais celle que j'avais à disposition n'était pas de bonne qualité, la pièce se déformait et n'était pas fidèle au modèle que j'avais fait sur sketchup.
Pour la réaliser, il faudra réfléchir à l'assemblage qui n'est pas réalisable dans l'état actuel des choses. J'ai du casser la pièce pour l'enlever de l'arceau.
Donc une très bonne raison de la réaliser ici. 
Je ne suis pas le seul à avoir eu ce problème ! https://www.youtube.com/watch?v=aj3AncT0iOc
Les photos sont visibles sur le gitHub : https://github.com/Levrden/ART6200-OpenSCAD-FocalSpiritOneRepair*/
color( "DimGray")


union(){
e=0.1;//variable de décalage pour éviter les artefacts après une différence
    
//Réglage de la qualité des arrondis
$fa=1;
$fs=0.2;
//Pièce principale avec rainure
difference(){
//Pièce Principale
    rotate_extrude(angle = 47.7) polygon( points=[[67.52,0],[75.52,0],[75.52,28],[67.52,28],[67.52,26],[74.52,26],[74.52,2],[67.52,2]] );
//Rainure
rotate_extrude(angle = 41.1) polygon( points=[[68.52,27],[69.52,27],[69.52,1],[68.52,1]] );
//Décalage de la rainure
rotate_extrude(angle = 10) polygon( points=[[67.52-e,27],[68.52+e,27],[68.52+e,1],[67.52-e,1]] );
}
//Encoche
rotate([0,0,32.9]){ //Décalage de l'origine
    difference(){
        //Encoche
        rotate_extrude(angle = 7.4) polygon( points=[[71.02,26],[72.02,26],[72.02,2],[71.02,2]] );
        //Décalage en épaisseur
        rotate_extrude(angle = 7.4) polygon( points=[[71.02,25],[72.02,25],[72.02,3],[71.02,3]] );
}}
//Fermeture en bout de pièce
rotate([0,0,44.5]){

        //Encoche
        rotate_extrude(angle = 3.2) polygon( points=[[67.52,27],[68.52,27],[68.52,1],[67.52,1]] );
}
//Trous taraudés et cales
union(){
    //Cales
    translate([74.02,2.5,7])rotate([0,0,2.5]){
    cale();
    translate([0,0,14])
    cale();}
    //Trous taraudés
    translate([72.2,7.5,6.5])rotate([0,90,5]){
    trouTar();
    translate([-15,0,0])
    trouTar();
    }
}
}

//Cales
module cale(){
    difference(){
    cube([1,3.5,3],true);//Base
    cube([1,2.5,1.5],true);//Trou
    }
}
//Trous taraudés
module trouTar(){
    union(){
        //Trou Taraudé
        difference(){
        cylinder(4,2,2,true);//Base
        cylinder(5,.5,.5,true);//Trou
        }
        //Cale en croix
        translate([0,0,1.35])rotate([0,0,45]){
        cube([0.8,6,1.25],true);
        rotate([0,0,90])
        cube([0.8,6,1.25],true);
        }
}
}


