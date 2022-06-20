//
//  Home.swift
//  UI-592
//
//  Created by nyannyan0328 on 2022/06/20.
//

import SwiftUI
import MapKit

struct Home: View {
    
    @State var showSeet :  Bool = false
    @State var sampleAlbums : [Album] = albums
    
    var body: some View {
        ZStack{
            
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10, longitude: 10), latitudinalMeters: 1000, longitudinalMeters: 1000)
            
            Map(coordinateRegion: .constant(region))
                .ignoresSafeArea()
                .overlay(alignment: .topTrailing) {
                    
                    
                    Button {
                        
                      
                        
                    } label: {
                        
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 20))
                        
                    }
                    .padding()

                }
            
                .bottmSheet(presetionDecents: [.medium,.large,.height(70)], isPresented: .constant(true), sheetCoornerRadius: 10) {
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        VStack{
                            
                            
                            TextField("Seach Text", text: .constant(""))
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background{
                                 
                                    
                                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                                        .fill(.ultraThinMaterial)
                                }
                            
                            
                            songList()
                            
                        }
                        .padding()
                        .padding(.top,20)
                        
                    }
                    .sheet(isPresented: $showSeet) {
                        
                        
                       songList()
                    }
                    
                  
                    
                    
                } onDismiss: {
                    
                    
                }

            
            
        }
    }
    @ViewBuilder
    func songList()->some View{
        
        VStack(spacing:15){
            
            
            ForEach($sampleAlbums){$sampleAlbums in
                
                HStack(spacing:15){
                    
                    
                    Text("#\(getIndex(album:sampleAlbums) + 1)")
                    
                    
                    Image(sampleAlbums.albumImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:60,height:60)
                        .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                    
                    
                    VStack(alignment: .leading,spacing:10) {
                        
                        
                        Text(sampleAlbums.albumName)
                            .font(.largeTitle.bold())
                            .foregroundColor(.black)
                        
                        
                        HStack{
                            
                             Image(systemName: "beats.headphones")
                                .font(.callout.bold())
                            
                              Text("2222222")
                        }
                        
                        
                    }
                      .frame(maxWidth: .infinity,alignment: .leading)
                    
                    
                    Button {
                        sampleAlbums.isLiked.toggle()
                    } label: {
                        
                         Image(systemName: "suit.heart.fill")
                            .foregroundColor(sampleAlbums.isLiked ? .red : .gray)
                            .scaleEffect(sampleAlbums.isLiked ? 2 : 1)
                        
                        
                    }
                    
                    Button {
                        
                        showSeet.toggle()
                       
                    } label: {
                        
                         Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: -90))
                        
                        
                    }

                    
                }
                
                
            }
        }
        
        
    }
    func getIndex(album : Album) -> Int{
        
        return albums.firstIndex { calbum in
            calbum.id == album.id
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

