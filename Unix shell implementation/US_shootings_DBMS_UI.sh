!/bin/sh
MainMenu()
{

    while [ "$CHOICE" != "START" ]
    do
        clear
        echo "================================================================="
        echo "| Oracle All Inclusive Tool|"
        echo "| Main Menu - Select Desired Operation(s):|"
        echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>|"
        echo "-----------------------------------------------------------------"
        echo " "
        echo " $IS_SELECTED1 1) Drop Tables"
        echo " $IS_SELECTED2 2) Create Tables"
        echo " $IS_SELECTED3 3) Populate Tables"
        echo " $IS_SELECTED4 4) Run Existing Queries"
        echo " $IS_SELECTED5 5) Query Database"
        echo " "
        echo " $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
        echo " "
        echo " $IS_SELECTEDE E) End/Exit"
        echo "Choose: "

        read CHOICE

        if [ "$CHOICE" == "0" ]
        then
            echo "Nothing Here"
            read -p "Press ENTER to continue..."
        elif [ "$CHOICE" == "5" ]
        then
                bash search.sh
                read -p "Press ENTER to continue..."
        elif [ "$CHOICE" == "1" ]
        then
            bash drop_tables.sh
            read -p "Press ENTER to continue..."
        elif [ "$CHOICE" == "2" ]
        then
            bash create_tables.sh
            read -p "Press ENTER to continue..."
        elif [ "$CHOICE" == "3" ]
        then
            bash populate_tables.sh
            read -p "Press ENTER to continue..."
        elif [ "$CHOICE" == "4" ]
        then
            bash queries.sh
            read -p "Press ENTER to continue..."
        elif [ "$CHOICE" == "E" ]
        then
            exit
        fi
    done
}

#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--

ProgramStart()
{
    StartMessage
    while [ 1 ]
    do
        MainMenu
    done
}


ProgramStart