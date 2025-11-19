#!/usr/bin/env python3
"""
XNAT automated setup using Selenium
"""
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options

def setup_xnat():
    print("Starting XNAT automated setup...")

    # Configure Chrome options for headless mode
    chrome_options = Options()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--disable-gpu')

    try:
        # Initialize the Chrome driver
        print("Initializing Chrome driver...")
        driver = webdriver.Chrome(options=chrome_options)
        driver.set_page_load_timeout(30)

        # Navigate to XNAT
        print("Navigating to http://localhost...")
        driver.get('http://localhost')

        # Wait a bit for JavaScript to load
        time.sleep(5)

        # Print page title and URL
        print(f"Page title: {driver.title}")
        print(f"Current URL: {driver.current_url}")

        # Check if we're on an error page
        page_source = driver.page_source
        if "XNAT has encountered an error" in page_source:
            print("ERROR: Still getting the guest user error page")
            print("Attempting to navigate directly to setup page...")

            # Try the setup/register URL directly
            driver.get('http://localhost/app/template/Register.vm')
            time.sleep(3)
            print(f"Register page URL: {driver.current_url}")

        # Try to find setup/registration form
        try:
            # Look for common form elements
            forms = driver.find_elements(By.TAG_NAME, 'form')
            print(f"Found {len(forms)} forms on the page")

            inputs = driver.find_elements(By.TAG_NAME, 'input')
            print(f"Found {len(inputs)} input fields")

            # Print form field names
            for inp in inputs[:10]:  # First 10 inputs
                name = inp.get_attribute('name')
                input_type = inp.get_attribute('type')
                if name:
                    print(f"  Input: name={name}, type={input_type}")

            # Look for specific setup fields
            if 'firstName' in page_source or 'login' in page_source:
                print("\nSetup form detected! Filling in details...")

                # Fill in the form
                fields = {
                    'firstName': 'Admin',
                    'lastName': 'User',
                    'login': 'admin',
                    'password': 'admin',
                    'password2': 'admin',
                    'email': 'admin@localhost',
                    'siteId': 'XNAT',
                    'adminEmail': 'admin@localhost',
                    'siteUrl': 'http://localhost'
                }

                for field_name, value in fields.items():
                    try:
                        field = driver.find_element(By.NAME, field_name)
                        field.clear()
                        field.send_keys(value)
                        print(f"  Filled {field_name}: {value}")
                    except Exception as e:
                        print(f"  Could not find field {field_name}: {e}")

                # Look for submit button
                submit_buttons = driver.find_elements(By.CSS_SELECTOR, 'input[type="submit"], button[type="submit"]')
                if submit_buttons:
                    print(f"\nFound {len(submit_buttons)} submit buttons")
                    print("Clicking submit button...")
                    submit_buttons[0].click()

                    # Wait for response
                    time.sleep(10)
                    print(f"After submit URL: {driver.current_url}")
                    print("Setup completed!")
                else:
                    print("No submit button found")
            else:
                print("Setup form not found. Saving page source...")
                with open('/Users/james/projects/xnat_docker_testing/page_source.html', 'w') as f:
                    f.write(driver.page_source)
                print("Page source saved to page_source.html")

        except Exception as e:
            print(f"Error finding form elements: {e}")

    except Exception as e:
        print(f"Error during setup: {e}")
        import traceback
        traceback.print_exc()
    finally:
        if 'driver' in locals():
            driver.quit()
            print("\nBrowser closed")

if __name__ == "__main__":
    setup_xnat()
