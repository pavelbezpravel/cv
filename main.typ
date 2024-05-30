#let configuration = yaml("configuration.yaml")
#let settings = yaml("settings.yaml")

#show link: set text(blue)

#show heading: h => [
  #set text(
    size: eval(settings.font.size.heading_large),
    font: settings.font.general
  )
  #h
]

#let sidebarSection = {[
  #par(justify: true)[
    #par[
      #set text(
        size: eval(settings.font.size.contacts),
        font: settings.font.minor_highlight,
      )

      Email: #link("mailto:" + configuration.contacts.email) \
      Phone: #link("tel:" + configuration.contacts.phone) \
      Telegram: #link(configuration.contacts.telegram.url)[#configuration.contacts.telegram.displayText] \
      LinkedIn: #link(configuration.contacts.linkedin.url)[#configuration.contacts.linkedin.displayText] \
      GitHub: #link(configuration.contacts.github.url)[#configuration.contacts.github.displayText] \

      #configuration.contacts.address
    ]
    #line(length: 100%)
  ]

  = Summary

  #par[
    #set text(
        eval(settings.font.size.education_description),
        font: settings.font.minor_highlight,
    )
    Highly qualified *software engineer* with 2+ years of experience in *C++ development*, have strong knowledge in *multithreading*, interested in *DevOps*, now seeking opportunities to excel in the realms of high-load distributed systems development.
  ]

  = Education

  #{
    for place in configuration.education [
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
            #link(place.university.url)[#place.university.name] \
            #place.from – #place.to
        ]
        #par[
          #set text(
            eval(settings.font.size.education_description),
            font: settings.font.minor_highlight,
          )
          #place.degree #place.major \
          *Specialization*: #place.specialization \
          *Track*: #place.track \
          *Thesis*: #place.thesis
        ]
    ]
  }

  = Skills

  #{
    for skill in configuration.skills [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
        #set text(
          font: settings.font.minor_highlight,
        )
        *#skill.name*
        #linebreak()
        #skill.items.join(" • ")
      ]
    ]
  }
]}

#let mainSection = {[
  #par[
    #set text(
      size: eval(settings.font.size.heading_huge),
      font: settings.font.general,
    )
    *#configuration.contacts.name*
  ]

  #par[
    #set text(
      size: eval(settings.font.size.heading),
      font: settings.font.minor_highlight,
      top-edge: 0pt
    )
    #configuration.contacts.title
  ]

  = Experience

  #{
    for job in configuration.jobs [
      #par(justify: false)[
        #set text(
          size: eval(settings.font.size.heading),
          font: settings.font.general
        )
          *#job.position*
          #link(job.company.url)[\@  #job.company.name] \
          #job.from – #job.to | #job.address
      ]
      #par(
        justify: false,
        leading: eval(settings.paragraph.leading)
      )[
        #set text(
          size: eval(settings.font.size.description),
          font: settings.font.general
        )
        #job.description

        #{
          for point in job.achievements [
            • #point \
          ]
        }
      ]
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight
        )
        *Stack*: #{
          let stack = job.stack.join(" • ")
          stack
        }
      ]
    ]
  }

  = Activities and societies

  #{
    for activity in configuration.activities [
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading)
      )[
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
          *#activity.activity*
          #link(activity.company.url)[\@  #activity.company.name] \
          #activity.from – #activity.to

        ]
        #par[
          #set text(
            size: eval(settings.font.size.description),
            font: settings.font.general
          )
          #activity.description
        ]
      ]
    ]
  }
]}

#{
  grid(
    columns: (2fr, 5fr),
    column-gutter: 3em,
    sidebarSection,
    mainSection,
  )
}
