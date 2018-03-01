\copy ld203_filings(filing_id, year, received, amount, type, period, registrant_id, registrant_name, registrant_address, registrant_country, lobbyist_name, source_file, comments) FROM 'dist/all_senate_meta.csv' WITH (FORMAT CSV, HEADER ON)
\copy ld203_contributions(contributor, contribution_type, payee, honoree, amount, contribution_date, filing_id, source_file, comments) FROM 'dist/all_senate_contributions.csv' WITH (FORMAT CSV, HEADER ON)

\copy ld203_house_filings(filer_type, organization_name, lobbyist_prefix, lobbyist_first_name, lobbyist_middle_name, lobbyist_last_name, lobbyist_suffix, contact_name, senate_reg_id, house_reg_id, report_year, report_type, amendment, comments, signed_date, certifiedcontent, no_contributions, filing_id, source_file, lobbyist_id, address1, address2, city, state, zip, zipext, country, contact_prefix, contact_phone, contact_email) FROM 'dist/all_house_meta.csv' WITH (FORMAT CSV, HEADER ON), 