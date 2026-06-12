library(shiny)

ui <- fluidPage(
  
  tags$head(
    tags$link(rel = "preconnect", href = "https://fonts.googleapis.com"),
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"),
    tags$style(HTML("

      * { font-family: 'Poppins', sans-serif; transition: background 0.4s, color 0.4s; }

      /* ── DARK MODE (default) ── */
      body.dark {
        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
        min-height: 100vh;
        color: #eee;
      }
      body.dark .well {
        background: rgba(255,255,255,0.07) !important;
        border: 1px solid rgba(255,255,255,0.12) !important;
        border-radius: 15px !important;
        box-shadow: 0 4px 20px rgba(0,0,0,0.3) !important;
      }
      body.dark label { color: #cdd6f4 !important; }
      body.dark .form-control {
        background: rgba(255,255,255,0.1) !important;
        border: 1px solid rgba(255,255,255,0.2) !important;
        color: white !important;
      }
      body.dark .nav-tabs > li > a { color: #aaa !important; }
      body.dark .nav-tabs > li.active > a,
      body.dark .nav-tabs > li > a:hover { color: #e94560 !important; border-bottom: 3px solid #e94560 !important; }
      body.dark .tab-content {
        background: rgba(255,255,255,0.05);
        border-radius: 15px;
        padding: 20px;
      }
      body.dark .boxhasil {
        background: rgba(255,255,255,0.07);
        border-left: 4px solid #e94560;
      }
      body.dark .boxhasil strong { color: #cdd6f4; }
      body.dark .hasil { color: #e94560; }
      body.dark pre {
        background: rgba(0,0,0,0.4) !important;
        color: #a6e3a1 !important;
        border: 1px solid rgba(255,255,255,0.1) !important;
      }
      body.dark .box-single {
        background: rgba(255,255,255,0.05);
        border: 1px solid rgba(255,255,255,0.1);
      }
      body.dark .box-single strong { color: #cdd6f4; }
      body.dark .riwayat-item {
        background: rgba(255,255,255,0.06);
        border-left: 3px solid #a6e3a1;
        color: #cdd6f4;
      }
      body.dark .tbl-stat table th { background: rgba(233,69,96,0.3); color: #fff; border-bottom: 2px solid #e94560; }
      body.dark .tbl-stat table td { color: #eee; border-bottom: 1px solid rgba(255,255,255,0.08); }
      body.dark .tbl-stat table tr:hover td { background: rgba(233,69,96,0.1); }
      body.dark .info-box {
        background: rgba(166,227,161,0.1);
        border: 1px solid rgba(166,227,161,0.3);
        color: #a6e3a1;
      }
      body.dark hr { border-color: rgba(255,255,255,0.15); }

      /* ── LIGHT MODE ── */
      body.light {
        background: linear-gradient(135deg, #f0f4ff 0%, #e8edf7 100%);
        min-height: 100vh;
        color: #1a1a2e;
      }
      body.light .well {
        background: #ffffff !important;
        border: 1px solid #dde3f0 !important;
        border-radius: 15px !important;
        box-shadow: 0 4px 20px rgba(0,0,0,0.08) !important;
      }
      body.light label { color: #2c3e6b !important; }
      body.light .form-control {
        background: #f7f9ff !important;
        border: 1px solid #c5cfe0 !important;
        color: #1a1a2e !important;
      }
      body.light .nav-tabs > li > a { color: #666 !important; background: transparent !important; border: none !important; border-bottom: 3px solid transparent !important; }
      body.light .nav-tabs > li.active > a,
      body.light .nav-tabs > li > a:hover { color: #e94560 !important; border-bottom: 3px solid #e94560 !important; background: transparent !important; }
      body.light .tab-content {
        background: #ffffff;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.06);
      }
      body.light .boxhasil {
        background: #f7f9ff;
        border-left: 4px solid #e94560;
        box-shadow: 0 2px 8px rgba(0,0,0,0.06);
      }
      body.light .boxhasil strong { color: #2c3e6b; }
      body.light .hasil { color: #e94560; }
      body.light pre {
        background: #f0f4ff !important;
        color: #2c7a4b !important;
        border: 1px solid #c5cfe0 !important;
      }
      body.light .box-single {
        background: #f7f9ff;
        border: 1px solid #dde3f0;
      }
      body.light .box-single strong { color: #2c3e6b; }
      body.light .riwayat-item {
        background: #f7f9ff;
        border-left: 3px solid #2c7a4b;
        color: #1a1a2e;
      }
      body.light .tbl-stat table th { background: rgba(233,69,96,0.15); color: #1a1a2e; border-bottom: 2px solid #e94560; }
      body.light .tbl-stat table td { color: #1a1a2e; border-bottom: 1px solid #dde3f0; }
      body.light .tbl-stat table tr:hover td { background: rgba(233,69,96,0.05); }
      body.light .info-box {
        background: rgba(44,122,75,0.08);
        border: 1px solid rgba(44,122,75,0.25);
        color: #2c7a4b;
      }
      body.light hr { border-color: #dde3f0; }

      /* ── SHARED ── */
      .judul {
        background: linear-gradient(90deg, #e94560, #0f3460);
        color: white;
        padding: 20px 30px;
        border-radius: 15px;
        text-align: center;
        margin-bottom: 25px;
        box-shadow: 0 4px 20px rgba(233,69,96,0.4);
      }
      .judul h2 { margin: 0; font-weight: 700; font-size: 26px; }
      .judul p  { margin: 5px 0 0; font-size: 13px; opacity: 0.85; font-weight: 300; }

      /* Toggle switch murni HTML/CSS/JS — tanpa checkboxInput */
      .toggle-wrap {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin-bottom: 12px;
        gap: 10px;
      }
      #mode-label { font-size: 13px; font-weight: 600; }
      .switch {
        position: relative;
        display: inline-block;
        width: 52px;
        height: 26px;
      }
      .switch input { display: none; }
      .knob {
        position: absolute;
        cursor: pointer;
        top: 0; left: 0; right: 0; bottom: 0;
        background: #e94560;
        border-radius: 26px;
        transition: background 0.4s;
      }
      .knob:before {
        position: absolute;
        content: '';
        height: 20px; width: 20px;
        left: 3px; bottom: 3px;
        background: white;
        border-radius: 50%;
        transition: transform 0.4s;
      }
      #toggle-cb:checked + .knob { background: #89b4fa; }
      #toggle-cb:checked + .knob:before { transform: translateX(26px); }

      .btn {
        background: linear-gradient(90deg, #e94560, #c62a47) !important;
        color: white !important;
        border: none !important;
        border-radius: 10px !important;
        width: 100% !important;
        padding: 10px !important;
        font-weight: 700 !important;
        font-size: 14px !important;
        letter-spacing: 1px !important;
        margin-top: 10px !important;
        box-shadow: 0 4px 15px rgba(233,69,96,0.4) !important;
      }

      .boxhasil { padding: 15px 20px; border-radius: 12px; margin-top: 12px; }
      .boxhasil strong { font-size: 13px; display: block; margin-bottom: 5px; }
      .hasil { font-size: 28px; font-weight: 700; }
      .box-single { border-radius: 15px; padding: 25px; margin-top: 10px; }
      pre { border-radius: 10px !important; font-size: 18px !important; font-weight: 700 !important; padding: 12px 18px !important; margin-top: 10px !important; }
      .tbl-stat table { width: 100%; border-collapse: collapse; }
      .tbl-stat table th, .tbl-stat table td { padding: 10px 15px; font-size: 13px; text-align: left; }
      .riwayat-item { border-radius: 10px; padding: 10px 15px; margin-bottom: 8px; font-size: 13px; }
      .riwayat-kosong { font-size: 13px; text-align: center; padding: 20px; color: #888; }
      .badge-op { display: inline-block; background: rgba(233,69,96,0.25); color: #e94560; padding: 2px 8px; border-radius: 20px; font-size: 11px; font-weight: 700; margin-right: 5px; }
      .info-box { border-radius: 10px; padding: 10px 15px; font-size: 12px; margin-bottom: 15px; }
      label { font-weight: 600 !important; font-size: 13px !important; }
      .form-control { border-radius: 8px !important; font-weight: 600 !important; }
      .nav-tabs { border-bottom: 2px solid rgba(128,128,128,0.2) !important; margin-bottom: 20px; }
      .nav-tabs > li > a { font-weight: 600 !important; font-size: 13px !important; padding: 10px 15px !important; }

    "))
  ),
  
  # ── Toggle switch murni (bukan checkboxInput) ────────────────
  div(class = "toggle-wrap",
      span(id = "mode-label", "🌙 Dark Mode"),
      tags$label(class = "switch",
                 tags$input(type = "checkbox", id = "toggle-cb"),
                 tags$span(class = "knob")
      )
  ),
  
  # ── JS: klik toggle → tukar class body + label + kirim ke Shiny ──
  tags$script(HTML("
    $(document).ready(function() {
      $('body').addClass('dark');

      $('#toggle-cb').on('change', function() {
        if ($(this).is(':checked')) {
          $('body').removeClass('dark').addClass('light');
          $('#mode-label').text('☀️ Light Mode');
          Shiny.setInputValue('is_light', true);
        } else {
          $('body').removeClass('light').addClass('dark');
          $('#mode-label').text('🌙 Dark Mode');
          Shiny.setInputValue('is_light', false);
        }
      });
    });
  ")),
  
  div(class = "judul",
      h2("🧮 Kalkulator Shiny"),
      p("Kalkulator sederhana dengan 4 operasi aritmatika")
  ),
  
  sidebarLayout(
    
    sidebarPanel(
      div(class = "info-box", "💡 Masukkan dua bilangan lalu klik Hitung"),
      numericInput("bil1", "Bilangan Pertama", value = 10),
      numericInput("bil2", "Bilangan Kedua", value = 5),
      checkboxInput("bulat", "Bulatkan ke 2 desimal", FALSE),
      hr(),
      submitButton("🔢 Hitung", icon = icon("calculator"))
    ),
    
    mainPanel(
      tabsetPanel(
        
        # ── Tab 1: Semua Operasi ──────────────────────────────
        tabPanel("📊 Semua Operasi",
                 div(class = "boxhasil",
                     strong("➕ Penjumlahan kedua bilangan tersebut yaitu"),
                     htmlOutput("jumlah")
                 ),
                 div(class = "boxhasil",
                     strong("➖ Pengurangan kedua bilangan tersebut yaitu"),
                     htmlOutput("kurang")
                 ),
                 div(class = "boxhasil",
                     strong("✖️ Perkalian kedua bilangan tersebut yaitu"),
                     htmlOutput("kali")
                 ),
                 div(class = "boxhasil",
                     strong("➗ Pembagian kedua bilangan tersebut yaitu"),
                     htmlOutput("bagi")
                 )
        ),
        
        # ── Tab 2: Penjumlahan ────────────────────────────────
        tabPanel("➕ Penjumlahan",
                 div(class = "box-single",
                     strong("Penjumlahan kedua bilangan tersebut yaitu"),
                     htmlOutput("jumlah2"),
                     verbatimTextOutput("jumlah_v")
                 )
        ),
        
        # ── Tab 3: Pengurangan ────────────────────────────────
        tabPanel("➖ Pengurangan",
                 div(class = "box-single",
                     strong("Pengurangan kedua bilangan tersebut yaitu"),
                     htmlOutput("kurang2"),
                     verbatimTextOutput("kurang_v")
                 )
        ),
        
        # ── Tab 4: Perkalian ──────────────────────────────────
        tabPanel("✖️ Perkalian",
                 div(class = "box-single",
                     strong("Perkalian kedua bilangan tersebut yaitu"),
                     htmlOutput("kali2"),
                     verbatimTextOutput("kali_v")
                 )
        ),
        
        # ── Tab 5: Pembagian ──────────────────────────────────
        tabPanel("➗ Pembagian",
                 div(class = "box-single",
                     strong("Pembagian kedua bilangan tersebut yaitu"),
                     htmlOutput("bagi2"),
                     verbatimTextOutput("bagi_v")
                 )
        ),
        
        # ── Tab 6: Statistik + Chart ──────────────────────────
        tabPanel("📈 Statistik",
                 br(),
                 div(class = "tbl-stat", tableOutput("statistik")),
                 br(),
                 plotOutput("chart", height = "280px")
        ),
        
        # ── Tab 7: Garis Bilangan ─────────────────────────────
        tabPanel("📏 Garis Bilangan",
                 br(),
                 plotOutput("garis_bilangan", height = "220px"),
                 br(),
                 uiOutput("keterangan_garis")
        ),
        
        # ── Tab 8: Riwayat ────────────────────────────────────
        tabPanel("🕘 Riwayat",
                 br(),
                 actionButton("hapus", "🗑️ Hapus Riwayat",
                              style = "background: rgba(233,69,96,0.2); color:#e94560;
                     border: 1px solid #e94560; border-radius:8px;
                     padding:6px 14px; font-size:12px; margin-bottom:15px;"),
                 uiOutput("riwayat_ui")
        )
        
      )
    )
  )
)

server <- function(input, output, session) {
  
  # ── Reactive: hitung semua operasi ──────────────────────────
  hasil <- reactive({
    tambah <- input$bil1 + input$bil2
    kurang <- input$bil1 - input$bil2
    kali   <- input$bil1 * input$bil2
    
    if (input$bil2 == 0) {
      bagi <- "Tidak dapat dibagi dengan nol"
    } else {
      bagi <- input$bil1 / input$bil2
    }
    
    if (input$bulat) {
      tambah <- round(tambah, 2)
      kurang <- round(kurang, 2)
      kali   <- round(kali, 2)
      if (is.numeric(bagi)) bagi <- round(bagi, 2)
    }
    
    list(tambah = tambah, kurang = kurang, kali = kali, bagi = bagi)
  })
  
  # ── HTML output helper ───────────────────────────────────────
  make_html <- function(val) {
    HTML(paste0("<div class='hasil'><strong>", val, "</strong></div>"))
  }
  
  output$jumlah  <- renderUI({ make_html(hasil()$tambah) })
  output$kurang  <- renderUI({ make_html(hasil()$kurang) })
  output$kali    <- renderUI({ make_html(hasil()$kali)   })
  output$bagi    <- renderUI({ make_html(hasil()$bagi)   })
  output$jumlah2 <- renderUI({ make_html(hasil()$tambah) })
  output$kurang2 <- renderUI({ make_html(hasil()$kurang) })
  output$kali2   <- renderUI({ make_html(hasil()$kali)   })
  output$bagi2   <- renderUI({ make_html(hasil()$bagi)   })
  
  output$jumlah_v <- renderPrint({ hasil()$tambah })
  output$kurang_v <- renderPrint({ hasil()$kurang })
  output$kali_v   <- renderPrint({ hasil()$kali   })
  output$bagi_v   <- renderPrint({ hasil()$bagi   })
  
  # ── Tab Statistik ────────────────────────────────────────────
  output$statistik <- renderTable({
    data.frame(
      Keterangan = c("Nilai Maksimum", "Nilai Minimum", "Rata-rata",
                     "Selisih Absolut", "Kuadrat Bil. 1", "Kuadrat Bil. 2"),
      Hasil = c(
        max(input$bil1, input$bil2),
        min(input$bil1, input$bil2),
        mean(c(input$bil1, input$bil2)),
        abs(input$bil1 - input$bil2),
        input$bil1^2,
        input$bil2^2
      )
    )
  }, striped = TRUE, hover = TRUE, bordered = TRUE)
  
  # ── Bar chart ────────────────────────────────────────────────
  output$chart <- renderPlot({
    h    <- hasil()
    ops  <- c("Penjumlahan", "Pengurangan", "Perkalian")
    vals <- c(as.numeric(h$tambah), as.numeric(h$kurang), as.numeric(h$kali))
    
    is_light <- isTRUE(input$is_light)
    bg_col   <- if (is_light) "#f7f9ff" else "#16213e"
    text_col <- if (is_light) "#2c3e6b" else "#cdd6f4"
    
    par(bg = bg_col, col.axis = text_col, col.lab = text_col,
        col.main = text_col, mar = c(4, 5, 3, 2))
    
    bp <- barplot(vals,
                  names.arg = ops,
                  col       = c("#e94560", "#a6e3a1", "#89b4fa"),
                  border    = NA,
                  main      = "Perbandingan Hasil Operasi",
                  ylab      = "Nilai",
                  cex.names = 1.0,
                  cex.main  = 1.1,
                  las       = 1
    )
    text(bp, vals + max(abs(vals), na.rm = TRUE) * 0.04,
         labels = vals, col = text_col, cex = 1, font = 2)
    
  }, bg = "transparent")
  
  # ── Garis Bilangan ───────────────────────────────────────────
  output$garis_bilangan <- renderPlot({
    
    b1 <- input$bil1
    b2 <- input$bil2
    h  <- hasil()
    
    pts       <- c(b1, b2, as.numeric(h$tambah), as.numeric(h$kurang))
    pts_valid <- pts[is.finite(pts)]
    margin    <- max(abs(pts_valid), na.rm = TRUE) * 0.3 + 5
    x_min     <- min(pts_valid, na.rm = TRUE) - margin
    x_max     <- max(pts_valid, na.rm = TRUE) + margin
    
    is_light <- isTRUE(input$is_light)
    bg_col   <- if (is_light) "#f7f9ff" else "#16213e"
    line_col <- if (is_light) "#2c3e6b" else "#cdd6f4"
    text_col <- if (is_light) "#2c3e6b" else "#cdd6f4"
    
    par(bg = bg_col, mar = c(4, 1, 3, 1))
    
    plot(NULL,
         xlim = c(x_min, x_max), ylim = c(-1.6, 2),
         xlab = "", ylab = "", yaxt = "n", bty = "n",
         main = "Visualisasi Garis Bilangan",
         col.main = text_col, col.axis = text_col
    )
    
    segments(x_min, 0, x_max, 0, col = line_col, lwd = 2)
    
    points(0, 0, pch = 19, col = line_col, cex = 1.2)
    text(0, -0.45, "0", col = text_col, cex = 0.85, font = 2)
    
    points(b1, 0, pch = 19, col = "#e94560", cex = 2)
    text(b1,  0.55, paste0("B1\n", b1), col = "#e94560", cex = 0.85, font = 2)
    
    points(b2, 0, pch = 19, col = "#89b4fa", cex = 2)
    text(b2,  1.2, paste0("B2\n", b2),  col = "#89b4fa", cex = 0.85, font = 2)
    
    if (is.finite(as.numeric(h$tambah))) {
      points(as.numeric(h$tambah), 0, pch = 17, col = "#a6e3a1", cex = 2)
      text(as.numeric(h$tambah), -0.9, paste0("+\n", h$tambah),
           col = "#a6e3a1", cex = 0.8, font = 2)
    }
    
    if (is.finite(as.numeric(h$kurang))) {
      points(as.numeric(h$kurang), 0, pch = 15, col = "#f9e2af", cex = 2)
      text(as.numeric(h$kurang), -1.55, paste0("-\n", h$kurang),
           col = "#f9e2af", cex = 0.8, font = 2)
    }
    
  }, bg = "transparent")
  
  output$keterangan_garis <- renderUI({
    is_light <- isTRUE(input$is_light)
    txt_col  <- if (is_light) "#2c3e6b" else "#cdd6f4"
    HTML(paste0(
      "<div style='font-size:12px; color:", txt_col, "; line-height:2;'>",
      "<span style='color:#e94560; font-weight:700;'>● B1</span> = Bilangan Pertama &nbsp;|&nbsp; ",
      "<span style='color:#89b4fa; font-weight:700;'>● B2</span> = Bilangan Kedua &nbsp;|&nbsp; ",
      "<span style='color:#a6e3a1; font-weight:700;'>▲ +</span> = Hasil Penjumlahan &nbsp;|&nbsp; ",
      "<span style='color:#f9e2af; font-weight:700;'>■ −</span> = Hasil Pengurangan",
      "</div>"
    ))
  })
  
  # ── Riwayat ──────────────────────────────────────────────────
  riwayat <- reactiveVal(list())
  
  observeEvent(hasil(), {
    h <- hasil()
    entri <- list(
      waktu  = format(Sys.time(), "%H:%M:%S"),
      bil1   = input$bil1,
      bil2   = input$bil2,
      tambah = h$tambah,
      kurang = h$kurang,
      kali   = h$kali,
      bagi   = h$bagi
    )
    rw <- c(list(entri), riwayat())
    if (length(rw) > 10) rw <- rw[1:10]
    riwayat(rw)
  }, ignoreInit = TRUE)
  
  observeEvent(input$hapus, { riwayat(list()) })
  
  output$riwayat_ui <- renderUI({
    rw <- riwayat()
    if (length(rw) == 0)
      return(div(class = "riwayat-kosong", "Belum ada riwayat perhitungan."))
    
    tagList(lapply(seq_along(rw), function(i) {
      r <- rw[[i]]
      div(class = "riwayat-item",
          span(class = "badge-op", paste0("#", i)),
          paste0("🕐 ", r$waktu, "  |  "),
          strong(paste0(r$bil1, " & ", r$bil2)), "  →  ",
          paste0("+ ", r$tambah, "  "),
          paste0("- ", r$kurang, "  "),
          paste0("× ", r$kali,   "  "),
          paste0("÷ ", r$bagi)
      )
    }))
  })
  
}

shinyApp(ui = ui, server = server)