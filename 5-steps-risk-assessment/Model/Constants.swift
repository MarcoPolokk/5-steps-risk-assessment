//
//  K.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 20/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

struct K {
    
    //MARK:- Polish Language Inputs
    
    struct Polish {
        
        static let label1Text = "1. Zatrzymaj się, rozejrzyj, sprawdź otoczenie"
        static let label2Text = "2. Przemyśl wykonywaną pracę"
        static let label2Description = "• Czy wiem, jak bezpiecznie wykonać zadanie?\n• Czy mam odpowiednie środki ochrony indywidualnej?\n• Czy potrzebuję pomocy współpracowników?"
        static let label3Text = "3. Zidentyfikuj zagrożenia"
        static let label3Description = "• Co może pójść nie tak?\n• W jaki sposób mogę zranić siebie lub innych?"
        static let label4Text = "4. Kontroluj oraz komunikuj ryzyko"
        static let label4Description = "• Czego potrzebuję do zapewnienia sobie bezpieczeństwa"
        static let label5Text = "5. Czy mogę wykonać to zadanie bezpiecznie?"
        static let warningLabel = "Jeśli nie możesz spełnić wszystkich punktów kontroli, nie podejmuj pracy!\nZgłoś się do swojego przełożonego"
        
        static let subject = "Wykonano ocenę ryzyka"
        static let none = "Brak"
        static let data1 = "Imię i nazwisko: "
        static let data2 = "Data: "
        static let data3 = "Miejsce: "
        static let data4 = "Opis pracy: "
        static let comm = "Komentarz: "
        
        static let cancelled = "Anulowano"
        static let failed = "Błąd przy wysyłaniu"
        static let saved = "Zapisano"
        static let sent = "Wysłano"
        static let error = "Błąd"
        
        
    }
    
    //MARK:- English Language Inputs
    
    struct English {
        
        static let label1Text = "1. Stop, look around and check your surroundings"
        static let label2Text = "2. Think about the work you need to do"
        static let label2Description = "• Do I know how to safely complete the task?\n• Do I have appropriate personal protective equipment?\n• Do I need help from colleagues?"
        static let label3Text = "3. Identify the threats"
        static let label3Description = "• What could go wrong?\n• How can I hurt myself or others?"
        static let label4Text = "4. Control and communicate the risk"
        static let label4Description = "• What I need to keep myself safe"
        static let label5Text = "5. Can I do this task safely?"
        static let warningLabel = "If you cannot meet all the checkpoints, do not start work!\nReport to your supervisor"
        
        static let subject = "Risk assessment performed"
        static let none = "Lack"
        static let data1 = "First name and Surname: "
        static let data2 = "Date: "
        static let data3 = "Place: "
        static let data4 = "Work description: "
        static let comm = "Comment: "
        
        static let cancelled = "Canceled"
        static let failed = "Error sending"
        static let saved = "Saved"
        static let sent = "Sent"
        static let error = "Error"
    }
    
    //MARK:- Other Inputs
    
    struct Other {
        
        static let animation = "BounceFill"
        static let checked = "checked"
        static let green = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
        static let red = #colorLiteral(red: 1, green: 0.2156862745, blue: 0.3725490196, alpha: 1)
        static let polish = "pl_PL"
    }
    
}
