//
//  Extencion.swift
//  UI-592
//
//  Created by nyannyan0328 on 2022/06/20.
//

import SwiftUI

extension View{
    
    @ViewBuilder
    func bottmSheet<Content : View>(
    
        presetionDecents : Set<PresentationDetent>,
        isPresented : Binding<Bool>,
        dragIndicator : Visibility = .visible,
        sheetCoornerRadius : CGFloat?,
        largesUndimidentifier : UISheetPresentationController.Detent.Identifier = .large,
        isTranslationBG : Bool = false,
        interactiveDisabeld : Bool = true,
        @ViewBuilder content : @escaping()->Content,
        onDismiss : @escaping()->()
        
        
        
        
        
    
    
    
    ) -> some View{
        
        self
            .sheet(isPresented: isPresented){
                
                onDismiss()
                
                
            } content:{
                
                content()
                    .presentationDetents(presetionDecents)
                    .presentationDragIndicator(dragIndicator)
                    .interactiveDismissDisabled(interactiveDisabeld)
                    .onAppear{
                        
                        
                        guard let windows = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return}
                     
                        
                        if let controller = windows.windows.first?.rootViewController?.presentedViewController,let sheet = controller.presentationController as? UISheetPresentationController{
                            
                            if isTranslationBG{
                                
                        
                                controller.view.backgroundColor = .clear
                                
                                
                            }
                            
                            controller.presentingViewController?.view.tintAdjustmentMode = .normal
                            sheet.largestUndimmedDetentIdentifier = largesUndimidentifier
                            sheet.preferredCornerRadius = sheetCoornerRadius
                    
                    
                            
                            
                            
                            
                        }
                        else{
                            
                            print("A")
                        }
                        
                    }
                
                
            }
        
        
    }
    
}
