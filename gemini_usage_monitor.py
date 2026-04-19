import google.generativeai as genai
import os
import json
from datetime import datetime

# API Raktas iš tavo konfigūracijos
API_KEY = "AIzaSyCKD4PucCEDn5Hq06Bbh1XwUB6lSHzdWMI"

def get_gemini_usage():
    print("=== GEMINI API MONITORIUS ===")
    genai.configure(api_key=API_KEY)
    
    report = {
        "tikrinimo_data": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "prieinami_modeliai": [],
        "islaidos_estimacija": "Nemokamas planas (Free Tier) - 0.00 USD",
        "limitai": {}
    }

    try:
        # 1. Gauname prieinamus modelius
        print("Tikrinami prieinami modeliai...")
        for m in genai.list_models():
            model_info = {
                "name": m.name,
                "version": m.version,
                "display_name": m.display_name,
                "description": m.description,
                "input_token_limit": m.input_token_limit,
                "output_token_limit": m.output_token_limit,
                "supported_methods": m.supported_generation_methods
            }
            report["prieinami_modeliai"].append(model_info)
            
            # Ištraukiame limitus (jei nurodyti)
            if 'generateContent' in m.supported_generation_methods:
                report["limitai"][m.name] = {
                    "max_input_tokens": m.input_token_limit,
                    "max_output_tokens": m.output_token_limit
                }

        # 2. Įrašome ataskaitą į failą
        report_file = "gemini_usage_report.json"
        with open(report_file, "w", encoding="utf-8") as f:
            json.dump(report, f, indent=4, ensure_ascii=False)
            
        print(f"\n[SĖKMĖ] Ataskaita išsaugota: {report_file}")
        
        # Trumpa santrauka į ekraną
        print(f"\nRasta modelių: {len(report['prieinami_modeliai'])}")
        print("-" * 30)
        for m in report['prieinami_modeliai'][:5]: # Rodyti tik pirmuosius 5
            print(f"Modelis: {m['display_name']} ({m['name']})")
            print(f"  - Max Tokenai (In): {m['input_token_limit']}")
        
    except Exception as e:
        print(f"Klaida jungiantis prie API: {e}")

if __name__ == "__main__":
    get_gemini_usage()
