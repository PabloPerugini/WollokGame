object guerrero {

    var puntaje = 0
    var fuerza = 30
    var destreza = 20
    var vidas = 3
    var vitalidad = 100
    var bolsa = 0

    method cantidadDePuntaje() {puntaje = self.bolsa() * 100}
    method subirPuntaje(unaCantidad){ puntaje = puntaje + unaCantidad}


    method fuerza() = fuerza
    method subirFuerza(unaCantidad) {fuerza = fuerza + unaCantidad}
    
    method destreza() = destreza
    method subirDestreza(unaCantidad) { destreza = destreza + unaCantidad}

    method vidas() = vidas
    method bajarUnaVida() {vidas = 0.max(vidas - 1)}
    method adquirirUnaVida() {vidas = vidas + 1}

    method vitalidad() = vitalidad
    method subirVitalidad(unaCantidad) { vitalidad = 100.min(vitalidad + unaCantidad) }
    method bajarVitalidad(unaCantidad) { vitalidad = 0.max(vitalidad - unaCantidad) }   

    method bolsa() = bolsa

    method estaVivo() = vitalidad > 0

    method caer() {
        if(self.vidas() > 0){
            self.bajarUnaVida()
        }
        else{
            //game over
        }
    }

    method cantidadDePoder() = (destreza * fuerza)/10

    method encontrarMoneda() {
        bolsa = bolsa + 1
        self.subirVitalidad(10)
        // la bolsa es para las monedas
    
    } 
    method validarNiveles(){
        if(bolsa % 10 == 0){
            self.subirNivel()
        }
    }

    method subirNivel(){
        self.subirFuerza(8)
        self.subirDestreza(5)
        self.subirPuntaje(250)
    }
    
    method atacar(unEnemigo){
        var cantVital = unEnemigo.vitalidad()
        if(unEnemigo.estaVivo()){
            unEnemigo.bajarVitalidad(self.cantidadDePoder())
        }
        else{
            self.subirVitalidad(cantVital / 10)
        }
        
    }
    
    method recivirUnAtaque(unEnemigo) {
        if (self.estaVivo()){
            self.bajarVitalidad(unEnemigo.cantidadDePoder())
        }
        else{
            self.caer()
        }
    } 



}