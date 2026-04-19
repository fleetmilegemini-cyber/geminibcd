import asyncio
import os
from askui import Agent
import time
from dotenv import load_dotenv

# Load env variables
env_path = os.path.join(os.path.dirname(__file__), '.env')
load_dotenv(env_path)

async def main():
    print("=== ARUODAS.LT CRAWLER (ROBUST MODE) ===")
    agent = Agent()
    
    try:
        # Step 1: Open Chrome using Run command (Win+R) - More reliable
        print("Step 1: Opening Chrome via Win+R...")
        agent.act("Press key combination 'command' + 'r'") # Win key is often 'command' in AskUI
        time.sleep(1)
        agent.act("Type 'chrome'")
        agent.act("Press enter")
        time.sleep(3)
        
        # Step 2: Navigate directly to the URL
        print("Step 2: Navigating to Aruodas...")
        # Focus on address bar (Ctrl+L)
        agent.act("Press key combination 'control' + 'l'")
        time.sleep(0.5)
        agent.act("Type 'https://www.aruodas.lt/butu-nuoma/vilniuje/?obj=1&FOrder=IDesc'") # Direct link with sorting
        agent.act("Press enter")
        time.sleep(5)
        
        # Step 3: Try to accept cookies using Enter key (often works if button is focused)
        print("Step 3: Attempting to clear overlays...")
        agent.act("Press enter") 
        time.sleep(1)
        
        print("=== TASK COMPLETE: Please check if Chrome is open with Aruodas! ===")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        agent.close()

if __name__ == "__main__":
    asyncio.run(main())
