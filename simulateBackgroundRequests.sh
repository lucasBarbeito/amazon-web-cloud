#!/bin/bash

urls=(
    "https://www.amazon.com/gp/product/B00VVOCSOU"
    "https://www.amazon.com/dp/B0C1HZ9HCM/ref=sspa_dk_detail_0?pd_rd_i=B0C1HZ9HCM&pd_rd_w=TJTNg&content-id=amzn1.sym.eb7c1ac5-7c51-4df5-ba34-ca810f1f119a&pf_rd_p=eb7c1ac5-7c51-4df5-ba34-ca810f1f119a&pf_rd_r=2WWY4KXDW4191WFW69T4&pd_rd_wg=r4EQX&pd_rd_r=0d782e49-be43-489b-a36d-45db35f12e93&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWw&th=1"
    "https://www.amazon.com/dp/B0BXSX7GX3/ref=sspa_dk_detail_0?psc=1&pd_rd_i=B0BXSX7GX3&pd_rd_w=zg2n6&content-id=amzn1.sym.0d1092dc-81bb-493f-8769-d5c802257e94&pf_rd_p=0d1092dc-81bb-493f-8769-d5c802257e94&pf_rd_r=40PHRC1Z5DDTR0903ZZF&pd_rd_wg=dIEAN&pd_rd_r=f8e7aa80-f515-4324-b15e-44db0e80cc11&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWwy"
    "https://www.amazon.com/dp/B0BXSX7GX3/ref=sspa_dk_detail_0?pd_rd_i=B0BXSX7GX3&pd_rd_w=zg2n6&content-id=amzn1.sym.0d1092dc-81bb-493f-8769-d5c802257e94&pf_rd_p=0d1092dc-81bb-493f-8769-d5c802257e94&pf_rd_r=40PHRC1Z5DDTR0903ZZF&pd_rd_wg=dIEAN&pd_rd_r=f8e7aa80-f515-4324-b15e-44db0e80cc11&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWwy&th=1"
    "https://www.amazon.com/dp/B0BRNTYTYK/ref=sspa_dk_detail_1?pd_rd_i=B0BRNTYTYK&pd_rd_w=5JCPk&content-id=amzn1.sym.0d1092dc-81bb-493f-8769-d5c802257e94&pf_rd_p=0d1092dc-81bb-493f-8769-d5c802257e94&pf_rd_r=BXVBKMN60W43A768E0EH&pd_rd_wg=GQvbQ&pd_rd_r=24952bdb-74dd-40cb-9d95-b53b7f307f9f&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWwy&th=1"
    "https://www.amazon.com/dp/B0CLFLH7K/ref=sspa_dk_detail_0?pd_rd_i=B0CLFLHR7K&pd_rd_w=RBxec&content-id=amzn1.sym.eb7c1ac5-7c51-4df5-ba34-ca810f1f119a&pf_rd_p=eb7c1ac5-7c51-4df5-ba34-ca810f1f119a&pf_rd_r=CGN921PYXRG069EYAZXX&pd_rd_wg=YRJva&pd_rd_r=877453df-4845-412e-8a46-7324b3cab0fa&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWw&th=1"
    "https://www.amazon.com/dp/B08TZGVSGJ/ref=sspa_dk_detail_2?psc=1&pd_rd_i=B08TZGVSGJ&pd_rd_w=k2YaN&content-id=amzn1.sym.386c274b-4bfe-4421-9052-a1a56db557ab&pf_rd_p=386c274b-4bfe-4421-9052-a1a56db557ab&pf_rd_r=HGHFWJ0381J35XZ80AWY&pd_rd_wg=sawOY&pd_rd_r=e7240688-b133-4a92-a782-d8f036174057&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWxfdGhlbWF0aWM"
    "https://www.amazon.com/TCL-Class-Full-1080p-Smart/dp/B0B232FKLB/ref=pd_ci_mcx_di_int_sccai_cn_d_sccl_1_5/139-0101742-9442428?pd_rd_w=891Zg&content-id=amzn1.sym.751acc83-5c05-42d0-a15e-303622651e1e&pf_rd_p=751acc83-5c05-42d0-a15e-303622651e1e&pf_rd_r=PA0ANQB5162EKCH9CQ8H&pd_rd_wg=OaMrC&pd_rd_r=34cd2b2e-544a-4fe4-b8dd-8ea45cffd379&pd_rd_i=B0B232FKLB&psc=1"
    "https://www.amazon.com/TCL-32S350R-Compatible-Compatibility-Television/dp/B0C1J1FS2C/ref=sims_dp_d_dex_ai_speed_loc_mtl_v4_d_sccl_1_6/139-0101742-9442428?pd_rd_w=qhEKP&content-id=amzn1.sym.af515e1d-64ab-47a5-8a2e-6be4d0f4cdc5&pf_rd_p=af515e1d-64ab-47a5-8a2e-6be4d0f4cdc5&pf_rd_r=04AZY6XC0095X9GYFBGH&pd_rd_wg=qsC8B&pd_rd_r=5ffbf7b7-f39c-483c-b699-b307e0126052&pd_rd_i=B0C1J1FS2C&psc=1"
    "https://www.amazon.com/dp/B0CLFLHR7K/ref=sspa_dk_detail_0?pd_rd_i=B0CLFLHR7K&pd_rd_w=RBxec&content-id=amzn1.sym.eb7c1ac5-7c51-4df5-ba34-ca810f1f119a&pf_rd_p=eb7c1ac5-7c51-4df5-ba34-ca810f1f119a&pf_rd_r=CGN921PYXRG069EYAZXX&pd_rd_wg=YRJva&pd_rd_r=877453df-4845-412e-8a46-7324b3cab0fa&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWw&th=1"
    )


for url in "${urls[@]}"; do
    curl -X POST \
         -H "Content-Type: application/json" \
         -H "Accept: application/json" \
         -d "{\"amazon_url\": \"$url\"}" \
         http://localhost:3000/backgroundProductUrl

    # Add sleep to avoid overwhelming the server with requests
    # sleep 1
done


