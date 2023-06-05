import wollok.game.*

class Maiz {
	var property position
	
	var estado = bebe
	
	
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		//return "maiz_bebe.png"
		return estado.image()
	}
	
	method regarse(){
		estado = adulto
	}
	
	method cosecharse(){
		game.removeVisual(self)
	}
	
	method estaLista() = estado == adulto
	
	method precio(){
   		return 150
    }
}

class Trigo {
	var property position
	var etapa = 0
	
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return "trigo_" + etapa + ".png" 
	}
	
	method regarse(){
		etapa = (etapa + 1) % 4
	}
	
	method estaLista() = etapa >= 2
	method precio() = (etapa - 1) * 100
}

class Tomaco {
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return "tomaco_ok.png"
	}
	method regarse(){
		etapa = (etapa + 1) % 4
	}
	
	method estaLista() = etapa >= 2
	method precio() = (etapa - 1) * 100
	
}

object bebe{method image() = "maiz_bebe.png"}
object adulto{method image() = "maiz_adulto.png"}