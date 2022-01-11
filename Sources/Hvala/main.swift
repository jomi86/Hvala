import Foundation
import Publish
import Plot
import SplashPublishPlugin

struct Hvala: Website {
  enum SectionID: String, WebsiteSectionID {
    case doniraj, nauči, razno
  }
  
  struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
  }
  
  // Update these properties to configure your website:
  var url = URL(string: "https://jomi86.github.io/hvala/")!
  var name = "Hvala"
  var description = "Stranica sa linkovima koji puno znače"
  var language: Language { .serbian }
  var imagePath: Path? { "images/AppIcon.png" }
}

// This will generate your website using the built-in Foundation theme:
//try Hvala().publish(withTheme: .foundation)
try Hvala().publish(using: [
  .installPlugin(.splash(withClassPrefix: "")),
  .addMarkdownFiles(),
  .copyResources(),
  .generateHTML(withTheme: .foundation),
  .generateSiteMap(),
])
