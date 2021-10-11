=begin
            ----The Porting "Dark Nights Rising" to Ruby Project!--
For the sake of portablility in the long run, I want to begin porting Dark Nights Rising to Ruby.

    This way, it will be able to run on all of the major platforms and be portable, not just on linux
=end 
    
require shoes       # import the shoes gem, we will be using it for building a gui 
# let's setup the GUI elements of the welcome screen for the game 
DarkNightsRising.app {
    # descriptors
    stack {
        title "Dark Nights Rising"
        subtitle "can you handle your own demons?"
        para strong("Welcome to Dark Nights Rising!"), "Ready to play?"
        para "Select an option below to get started."
    }
    # add in the buttons
    stack {
        button "Play Dark Nights Rising"
        button "Load Previous Game"
        button "Delete Previous Game"
        button "Exit Dark Nights Rising"
    }
}
