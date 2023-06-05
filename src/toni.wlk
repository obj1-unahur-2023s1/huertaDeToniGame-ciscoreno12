import wollok.game.*
import plantas.*


object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	const cosasSembradas = []
	const cosasCosechadas = []
	var oro = 0
	
	method configurarMovimiento() {	
    	keyboard.left().onPressDo { self.moverIzquierda() }
   	 	keyboard.right().onPressDo { self.moverDerecha()  }
    	keyboard.up().onPressDo { self.moverArriba()  }
    	keyboard.down().onPressDo { self.moverAbajo() }
    }
    
   	method agregarFilasMaices(){
   		(1..13).forEach { x => self.sembrar(new Maiz(position = position), game.at(x, 5)) }
   }
    
    method configurarTareas() {
    	keyboard.m().onPressDo { self.sembrar(new Maiz(position = position))  	}
    	keyboard.t().onPressDo { self.sembrar(new Trigo(position = position)) 	}
    	keyboard.o().onPressDo { self.sembrar(new Tomaco()) }
    	keyboard.a().onPressDo { self.regar()  }
    	keyboard.r().onPressDo { self.regarTodas()   }
    	keyboard.x().onPressDo { self.cosecharTodo() }
    	keyboard.c().onPressDo { self.cosecharPlanta() }
    	keyboard.v().onPressDo { self.vender() }
    	keyboard.space().onPressDo {game.say(self, self.mensajeOro() }
    }	
    	
    	//keyboard.v().onPressDo { self.venderTodo()  }
    	//keyboard.space().onPressDo { self.estado() 
	method mensajeOro() = "Tengo " + oro + " monedas de oro"
    
    method moverIzquierda(){
        position = position.left(1)
    }
    
    method moverDerecha(){
        position = position.right(1)
    }
    
    method moverArriba(){
        position = position.up(1)
    }
    
    method moverAbajo(){
        position = position.down(1)
    }
    
    method sembrar(planta) {
    	if(not game.colliders(self).isEmpty()){
    		throw new Exception(message = "ya hay sembrado")
    	}
    	cosasSembradas.add(planta)
    	game.addVisualIn(planta, position)
    }
    
    method regar() {
    	game.colliders(self).forEach({planta => planta.regarse()})
    }
    
    method regarTodas() {
       cosasSembradas.forEach({planta => planta.regarse()})
    	
    }
    
    method cosecharTodo(){
    	
    }
    
    method cosecharPlanta(){
    	game.colliders(self).forEach({planta => self.cosecharUna(planta)})
  	}
  	
  	method cosecharUna(planta){
  		if(planta.estaLista()){
  			cosasCosechadas.add(planta)
  			cosasSembradas.remove(planta)
  			game.removeVisual(planta)	
   		}
   }
   
   method vender() {
   		oro = oro + cosasCosechadas.sum({p => p.precio()})
   		cosasCosechadas.clear()
   }
}

	








