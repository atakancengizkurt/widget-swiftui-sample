//
//  WidgetPokemon.swift
//  WidgetPokemon
//
//  Created by Atakan Cengiz KURT on 15.05.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
  @AppStorage("pokemon", store: UserDefaults(suiteName: "group.atakancengizkurt.PokemonWidget"))
  var pokemonData: Data = Data()
  
    func placeholder(in context: Context) -> SimpleEntry {
      SimpleEntry(date: Date(), configuration: ConfigurationIntent(), pokemon: Pokemon(imageName: "pikachu", name: "Pikachu", type: "Mouse Pokemon"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
      if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData){
        let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
        completion(entry)
      }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
      if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData){
        let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
      }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let pokemon: Pokemon
}

struct WidgetPokemonEntryView : View {
    var entry: Provider.Entry

    var body: some View {
      PokemonView(pokemon: entry.pokemon)
    }
}

@main
struct WidgetPokemon: Widget {
    let kind: String = "WidgetPokemon"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetPokemonEntryView(entry: entry)
        }
        .configurationDisplayName("Pokemon Widget")
        .description("This is an example pokemon widget.")
    }
}


