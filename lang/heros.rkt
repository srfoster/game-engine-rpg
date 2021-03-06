#lang racket

(require 2htdp/image
         game-engine
         racket/runtime-path)


#;
(provide basic-hero)

(define-runtime-path images-path "images")


#;
(define (basic-hero p)

  (define hero-costume
    (sheet->sprite (freeze
                    (scale ;0.079
                     0.05
                     ;Ummm no....
                     (bitmap/file (build-path images-path "sprite-sheet.png"))))
                   #:rows       4
                   #:columns    4
                   #:row-number 2
                   #:speed      5))

  #;(define (hero-costume)
      (sprite->entity 
       #:name       "hero-appearance"
       #:position   p
       #:components
       (lock-to "hero" #:offset (posn 0 -10))
       #;(static)
       ))

  #;(sprite->entity (square 5 "solid" "pink")
                  #:name       "player"
                  #:position   p
                  #:components (direction 0)
                               (rotation-style 'left-right)
                               (physical-collider)
                               
                               (key-movement 5 #:rule all-dialog-closed?)
                               
                               (counter 0)
                               (on-no-key-movement (stop-animation))
                               (on-key-movement (start-animation)))
      
  (sprite->entity (square 5 "solid" "pink")
                  #:name       "player"
                  #:position   p 
                  #:components
                  (direction 0)
                  (rotation-style 'left-right)
                  (physical-collider)

                  (key-movement 5)
                  (counter 0)
                  
                  (on-no-key-movement (stop-animation))
                  (on-key-movement (start-animation))
                  
                  (on-key 'right (set-direction 0))
                  (on-key 'left  (set-direction 180))
                  
                  (on-start
                    (λ(g e)
                      (update-entity e
                                     animated-sprite?
                                     hero-costume)))
                  
                  ))

