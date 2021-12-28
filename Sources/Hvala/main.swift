import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Hvala: Website {
  enum SectionID: String, WebsiteSectionID {
    // Add the sections that you want your website to contain here:
    case posts
  }
  
  struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
  }
  
  // Update these properties to configure your website:
  var url = URL(string: "https://your-website-url.com")!
  var name = "Hvala"
  var description = "Stranica sa linkovima koji puno znače"
  var language: Language { .english }
  var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Hvala().publish(withTheme: .foundation,
                    deployedUsing: .gitHub("jomi86/Hvala", useSSH: false))
