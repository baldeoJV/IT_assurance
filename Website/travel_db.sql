-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 03:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodations`
--

CREATE TABLE `accomodations` (
  `Type` varchar(7) DEFAULT NULL,
  `Size` varchar(16) DEFAULT NULL,
  `City` varchar(7) DEFAULT NULL,
  `Municipality` varchar(15) DEFAULT NULL,
  `Address` varchar(899) DEFAULT NULL,
  `Environment` varchar(54) DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `accomodations`
--

INSERT INTO `accomodations` (`Type`, `Size`, `City`, `Municipality`, `Address`, `Environment`, `Cost`, `id`) VALUES
('Mid', '2', 'Palawan', 'El nido', 'https://www.skyscanner.com.ph/hotels/philippines/el-nido-hotels/villa-israel-ecopark-el-nido/ht-157070800?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=1448&correlation_id=e401f698-6cb4-4199-851a-19ec90ab8ba4&currency=PHP&filters=%7B%22OPTION_KEY_CANCELLATION_POLICY%22%3A%5B%22ROOM_FILTER_OPTION_TYPE_REFUNDABLE%22%5D%7D&impression_id=aa5d3158-92ec-4a84-bc63-56f9e1bc669c&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=cc63a31971a3cada7f23023c50365da8&search_entity_id=157070800&source=GoogleHpa', 'Urban (cities, shopping, nightlife)', 1448, 2),
('Budget', '2', 'Palawan', 'El nido', 'https://www.skyscanner.com.ph/hotels/philippines/el-nido-hotels/jvhaven-pension/ht-159189109?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=935&correlation_id=e401f698-6cb4-4199-851a-19ec90ab8ba4&currency=PHP&filters=%7B%22OPTION_KEY_CANCELLATION_POLICY%22%3A%5B%22ROOM_FILTER_OPTION_TYPE_REFUNDABLE%22%5D%7D&impression_id=aa5d3158-92ec-4a84-bc63-56f9e1bc669c&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=cc63a31971a3cada7f23023c50365da8&search_entity_id=157070800&source=GoogleHpa', 'Nature & outdoors (mountains, beaches, national parks)', 935, 3),
('Luxury', '2', 'Palawan', 'El nido', 'https://www.skyscanner.com.ph/hotels/philippines/el-nido-hotels/el-nido-beach-hotel/ht-128808016?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=8663&correlation_id=430597d3-4369-47e5-a980-bd8ea220f036&currency=PHP&impression_id=aa5d3158-92ec-4a84-bc63-56f9e1bc669c&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=abeca2f7c353aaa4825837c8c489d822&search_entity_id=128808016&source=GoogleHpa', 'Nature & outdoors (mountains, beaches, national parks)', 8663, 4),
('Luxury', '2', 'Palawan', 'El nido', 'https://www.skyscanner.com.ph/hotels/philippines/el-nido-hotels/cuna-hotel/ht-179136517?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=5384&correlation_id=430597d3-4369-47e5-a980-bd8ea220f036&currency=PHP&impression_id=aa5d3158-92ec-4a84-bc63-56f9e1bc669c&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=abeca2f7c353aaa4825837c8c489d822&search_entity_id=128808016&source=GoogleHpa', 'Urban (cities, shopping, nightlife)', 4257, 5),
('Budget', '2', 'Palawan', 'Puerto Princesa', 'https://www.skyscanner.com.ph/hotels/philippines/puerto-princesa-hotels/orange-mangrove-pension-house/ht-127803837?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=789&correlation_id=4b8aeed6-8550-44f9-b6c1-3d398bcf0417&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&poiId=95674098&priceType=price-per-night&search_cycle_id=20cb67a8c2bc57fd1fe2be0634455d8e&search_entity_id=27546026', 'Urban (cities, shopping, nightlife)', 789, 6),
('Mid ', '2', 'Palawan', 'Puerto Princesa', 'https://www.skyscanner.com.ph/hotels/philippines/puerto-princesa-hotels/blue-lagoon-inn-%26-suites/ht-114292600?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=1210&correlation_id=4b8aeed6-8550-44f9-b6c1-3d398bcf0417&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&poiId=95674098&priceType=price-per-night&search_cycle_id=20cb67a8c2bc57fd1fe2be0634455d8e&search_entity_id=27546026', 'Nature & outdoors (mountains, beaches, national parks)', 1210, 7),
('Luxury', '2', 'Palawan', 'Puerto Princesa', 'https://www.skyscanner.com.ph/hotels/philippines/puerto-princesa-hotels/hue-hotels-and-resorts-puerto-princesa-managed-by-hii/ht-200631994?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=4476&correlation_id=37de3b0e-c245-42aa-9395-49d459191ba1&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=ece820a02b82a815344091b1bc7e0ce9&search_entity_id=200631994', 'Urban (cities, shopping, nightlife)', 4476, 8),
('Luxury', '2', 'Palawan', 'Puerto Princesa', 'https://www.skyscanner.com.ph/hotels/philippines/bancaobancao-hotels/princesa-garden-island-resort-and-spa/ht-131201166?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=9084&correlation_id=cdc7bcf1-31b9-45f8-ae34-4bdf9b69838a&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=64fb9a30f4b82d27bf5c9544fd8fb50f&search_entity_id=95674098', 'Urban (cities, shopping, nightlife)', 9984, 9),
('Luxury', '2', 'Palawan', 'Coron', 'https://www.skyscanner.com.ph/hotels/philippines/coron-hotels/two-seasons-coron-island-resort/ht-134137280?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=120125&correlation_id=c3dd530e-d580-413f-9680-2ee49db24eee&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=6a846b1948d82f029103cd8f6b53fee5&search_entity_id=44301205', 'Nature & outdoors (mountains, beaches, national parks)', 120125, 10),
('Luxury', '2', 'Palawan', 'Coron', 'https://www.skyscanner.com.ph/hotels/philippines/coron-hotels/the-funny-lion-coron/ht-130423460?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=27396&correlation_id=f471c402-a1c9-4b0c-8e87-32aa1623ab8c&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=6a846b1948d82f029103cd8f6b53fee5&search_entity_id=44301205', 'Nature & outdoors (mountains, beaches, national parks)', 27396, 11),
('Budget', '2', 'Palawan', 'Coron', 'https://www.skyscanner.com.ph/hotels/philippines/coron-hotels/footprints-hostel/ht-216805001?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=605&correlation_id=d57ddd8d-a692-4a5e-b2ca-00e5b60ebcb5&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=6a846b1948d82f029103cd8f6b53fee5&search_entity_id=44301205', 'Urban (cities, shopping, nightlife)', 605, 12),
('Mid', '2', 'Palawan', 'Coron', 'https://www.skyscanner.com.ph/hotels/philippines/coron-hotels/prim-travellers-inn/ht-190596082?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=1175&correlation_id=ecc57412-ad50-4ab5-82b6-8c47341903b3&currency=PHP&impression_id=4351b97e-f8f6-4b98-b9f1-0bab1ae57f31&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=6a846b1948d82f029103cd8f6b53fee5&search_entity_id=44301205', 'Urban (cities, shopping, nightlife)', 1354, 13),
('Luxury', '2', 'Bohol', 'Panglao', 'https://www.skyscanner.com.ph/hotels/philippines/duljo-hotels/the-bellevue-resort/ht-114356726?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=14517&correlation_id=ceb4aee4-6ef6-49fe-ab73-db51dfb4aaed&currency=PHP&impression_id=6814785a-9ac5-41f3-b6f4-1c07fcdaa344&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=a486a973933447b4e61709f21676771f&search_entity_id=44292655', 'Nature & outdoors (mountains, beaches, national parks)', 14517, 14),
('Luxury', '2', 'Bohol', 'Panglao', 'https://www.skyscanner.com.ph/hotels/philippines/bolod-hotels/oceanica-resort-panglao-formerly-south-palms-resort-panglao/ht-133696646?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=16165&correlation_id=ceb4aee4-6ef6-49fe-ab73-db51dfb4aaed&currency=PHP&impression_id=6814785a-9ac5-41f3-b6f4-1c07fcdaa344&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=a486a973933447b4e61709f21676771f&search_entity_id=44292655', 'Nature & outdoors (mountains, beaches, national parks)', 16165, 15),
('Luxury', '2', 'Bohol', 'Panglao', 'https://www.skyscanner.com.ph/hotels/philippines/dauis-hotels/bohol-shores/ht-134506072?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=12938&correlation_id=ceb4aee4-6ef6-49fe-ab73-db51dfb4aaed&currency=PHP&impression_id=6814785a-9ac5-41f3-b6f4-1c07fcdaa344&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=a486a973933447b4e61709f21676771f&search_entity_id=44292655', 'Nature & outdoors (mountains, beaches, national parks)', 12938, 16),
('Luxury', '2', 'Bohol', 'Panglao', 'https://www.skyscanner.com.ph/hotels/philippines/taiwala-hotels/henann-resort-alona-beach/ht-134585467?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=18401&correlation_id=08d26ee9-4dd5-4f0f-a52b-b2fc767cd81d&currency=PHP&impression_id=88d3c951-f431-4713-9862-edc2f76d7259&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=a486a973933447b4e61709f21676771f&search_entity_id=44292655', 'Nature & outdoors (mountains, beaches, national parks)', 18401, 17),
('Budget', '2', 'Bohol', 'Anda', 'https://www.skyscanner.com.ph/hotels/philippines/bacong-hotels/casa-amihan/ht-130071558?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=4459&correlation_id=bf445bdc-e7f5-4c61-9f5a-a73761878640&currency=PHP&impression_id=8c96a057-4b1f-465a-bf87-8232bc38e63e&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=38c51fbcd4ba12872702cabe7ef16f0b&search_entity_id=44301525', 'Nature & outdoors (mountains, beaches, national parks)', 4459, 18),
('Budget', '2', 'Bohol', 'Anda', 'https://www.skyscanner.com.ph/hotels/philippines/anda-hotels/anda-de-boracay-white-sand-resort/ht-134590527?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=1862&correlation_id=bf445bdc-e7f5-4c61-9f5a-a73761878640&currency=PHP&impression_id=8c96a057-4b1f-465a-bf87-8232bc38e63e&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=38c51fbcd4ba12872702cabe7ef16f0b&search_entity_id=44301525', 'Nature & outdoors (mountains, beaches, national parks)', 3185, 19),
('Budget', '2', 'Bohol', 'Anda', 'https://www.skyscanner.com.ph/hotels/philippines/anda-hotels/j-%26-a-traveller-s-inn/ht-218770718?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=1549&correlation_id=bf445bdc-e7f5-4c61-9f5a-a73761878640&currency=PHP&impression_id=8c96a057-4b1f-465a-bf87-8232bc38e63e&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=38c51fbcd4ba12872702cabe7ef16f0b&search_entity_id=44301525', 'Nature & outdoors (mountains, beaches, national parks)', 1549, 20),
('Budget', '2', 'Bohol', 'Anda', 'https://www.skyscanner.com.ph/hotels/philippines/anda-hotels/andabay-tourist-inn/ht-222077336?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=1040&correlation_id=bf445bdc-e7f5-4c61-9f5a-a73761878640&currency=PHP&impression_id=8c96a057-4b1f-465a-bf87-8232bc38e63e&locale=en-GB&market=PH&priceType=price-per-night&search_cycle_id=38c51fbcd4ba12872702cabe7ef16f0b&search_entity_id=44301525#/hotels-gallery ', 'Nature & outdoors (mountains, beaches, national parks)', 1040, 21),
('Luxury', '2', 'Davao', 'Davao', 'https://www.skyscanner.com.ph/hotels/philippines/malagos-hotels/malagos-garden-resort/ht-201164872?checkin=2024-12-23&checkout=2024-12-24&rooms=1&adults=2&clicked_details_price=5085&correlation_id=982edf3a-7001-4296-8ca4-8017870f1564&currency=PHP&impression_id=1b9b50e8-0501-4752-96ec-eb5afa384d09&locale=en-GB&market=PH&poiId=217880099&priceType=price-per-night&search_cycle_id=6d7f41ed1dd24d680699f192a33e9ae5&search_entity_id=201164872', 'Urban (cities, shopping, nightlife)', 5085, 22),
('Budget', '2', 'Davao', 'Davao', 'https://www.trip.com/hotels/davao-hotel-detail-699520/my-hotel/?cityId=1458&checkIn=2024-12-23&checkOut=2024-12-24&adult=2&children=0&subStamp=3001547&crn=1&ages=&travelpurpose=0&curr=PHP&fgt=1&hasAidInUrl=true&mincurr=PHP&mproom=846819093&link=book&hoteluniquekey=H4sIAAAAAAAA_wD_AAD_CmAKAhgCEgQIARAAGlQIld7lkwMSATIYADDfATi1H5gBgNkqqAEBuAECwAEC0QFmZmZmZlWTQOEBXI_C9SinlUDoAarHj6ABiAJCiQQAAAAAAAAAAKAEAKEFAAAAAAAAAAAaIDZhNTllZjNmMzY3OTQyNzhiNzc3ZmNjNTAwODAwZjkzIAEo4LSBuwZIAVIGMTk2YWQ2WhwKA1VTRBH7y-7JwyIdQBoDUEhQIfFjzF1LyL8_YgVlbl9YWGiHEXABeACKAQdIAXgAyAEBqgEHCgMwMjEQAvIBIjZhNTllZjNmMzY3OTQyNzhiNzc3ZmNjNTAwODAwZjkzXzOSAgE0AAAA__8BAAD__zytfHD_AAAA&subChannel=&masterhotelid_tracelogid=658dc496a04f431e852ec457e6b91619&NewTaxDescForAmountshowtype0=F&detailFilters=17%7C1%7E17%7E1*80%7C2%7C1%7E80%7E2&hotelType=meta&trip_sub1=415ab01c-b49e-45c2-b05e-d6678c8becc7&locale=en-XX', 'Urban (cities, shopping, nightlife)', 1386, 23),
('Mid ', '2', 'Davao', 'Davao', 'https://www.booking.com/hotel/ph/the-royal-mandaya.en-gb.html?aid=963523&label=metaskyscan-hotel-373247_lang-en_curr-PHP_clkid-5f64786ddc00417d8703676c8b0042df&sid=52c47d539d83cfc50e616820690f608a&all_sr_blocks=37324701_347365343_0_42_0&checkin=2024-12-23&checkout=2024-12-24&dest_id=-2424066&dest_type=city&dist=0&group_adults=2&group_children=0&hapos=1&highlighted_blocks=37324701_347365343_0_42_0&hpos=1&matching_block_id=37324701_347365343_0_42_0&no_rooms=1&req_adults=2&req_children=0&room1=A%2CA&sb_price_type=total&show_room=37324701&sr_order=popularity&sr_pri_blocks=37324701_347365343_0_42_0__289000&srepoch=1734368032&srpvid=797d76cfd3b9012d&type=total&ucfs=1&#RD37324701', 'Urban (cities, shopping, nightlife)', 2890, 24),
('Mid ', '2', 'Davao', 'Davao', 'https://www.booking.com/hotel/ph/dusitd2-davao.en-gb.html?aid=306395&label=davao-city-8EmXEx91JVsT_d7cHwcycwS392710301709%3Apl%3Ata%3Ap170%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-17510060669%3Alp9060949%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YZVcNNsENnH02-pWD53qm9c&sid=52c47d539d83cfc50e616820690f608a&all_sr_blocks=413607001_0_2_0_0&checkin=2024-12-23&checkout=2024-12-24&dest_id=-2424066&dest_type=city&dist=0&group_adults=2&group_children=0&hapos=1&highlighted_blocks=413607001_0_2_0_0&hpos=1&matching_block_id=413607001_0_2_0_0&no_rooms=1&req_adults=2&req_children=0&room1=A%2CA&sb_price_type=total&sr_order=popularity&sr_pri_blocks=413607001_0_2_0_0__716965&srepoch=1734368563&srpvid=8e0a77d619e3065d&type=total&ucfs=1&', 'Urban (cities, shopping, nightlife)', 7170, 25),
('Luxury ', '2', 'Davao', 'Samal', 'https://pearlfarmresort.reserve-online.net/?room=STE&checkin=2024-12-17&rooms=1&nights=1&adults=2', 'Nature & outdoors (mountains, beaches, national parks)', 48900, 26),
('Luxury ', '2', 'Davao', 'Samal', 'https://pearlfarmresort.reserve-online.net/?room=STE&checkin=2024-12-17&rooms=1&nights=1&adults=2', 'Nature & outdoors (mountains, beaches, national parks)', 26900, 27),
('Luxury ', '2', 'Davao', 'Samal', 'https://pearlfarmresort.reserve-online.net/?room=STE&checkin=2024-12-17&rooms=1&nights=1&adults=2', 'Nature & outdoors (mountains, beaches, national parks)', 29900, 28),
('Mid', '2', 'Davao', 'Davao', 'https://www.skyscanner.com.ph/hotels/philippines/davao-hotels/romantic-studio-unit%2c-matina-enclaves-residences/ht-213101425?checkin=2024-12-24&checkout=2024-12-25&rooms=1&adults=2&clicked_details_price=3710&correlation_id=8d6d5fb0-53e0-4bbc-b588-3f2360d90f1e&currency=PHP&impression_id=5d484ecc-e907-41ac-b8f4-a1e08a61ad45&locale=en-GB&market=PH&poiId=221575514&priceType=price-per-night&search_cycle_id=7589adc8d6a6bacb9b951f9f703baa24&search_entity_id=27540836', 'Urban (cities, shopping, nightlife)', 3710, 29),
('Mid', '2', 'Cebu', 'Cebu City', 'https://www.google.com/travel/search?q=Sirao%20Garden%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCAoCCAMKAggDGhwSGhIUCgcI6A8QDBgYEgcI6A8QDBgZGAEyAhAAKgcKBToDUEhQ&qs=CAEyE0Nnb0k5NmF4bUpiWC02MFBFQUU4CkIJEUT0hlYEuBXSQgkR8RdEq-ZXU-1CCREIJaHRDkncy1pcCAEyWKoBVRABKhEiDWFjY29tbW9kYXRpb24oADIeEAEiGjLW7V9eHtUObOxf8q2Z90Gd8n1-fTV-h9WlMh4QAiIac2lyYW8gZ2FyZGVuIGFjY29tbW9kYXRpb24&ap=aAG6AQhvdmVydmlldw&ictx=111&ved=0CAAQ5JsGahcKEwjY4tnlyLGKAxUAAAAAHQAAAAAQBg', 'Nature & outdoors (mountains, beaches, national parks)', 3233, 30),
('Mid', '2', 'Cebu', 'Cebu City', 'https://www.google.com/travel/search?q=Sirao%20Garden%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCAoCCAMKAggDGhwSGhIUCgcI6A8QDBgYEgcI6A8QDBgZGAEyAhAAKgcKBToDUEhQ&qs=CAEyFENnc0lpcnZkellpVDA1TGhBUkFCOApCCRFE9IZWBLgV0kIJEfEXRKvmV1PtQgkRCCWh0Q5J3MtaXAgBMliqAVUQASoRIg1hY2NvbW1vZGF0aW9uKAAyHhABIhoy1u1fXh7VDmzsX_KtmfdBnfJ9fn01fofVpTIeEAIiGnNpcmFvIGdhcmRlbiBhY2NvbW1vZGF0aW9u&ap=aAG6AQhvdmVydmlldw&ictx=111&ved=0CAAQ5JsGahcKEwjg1dGlybGKAxUAAAAAHQAAAAAQEQ', 'Nature & outdoors (mountains, beaches, national parks)', 6682, 31),
('Mid', '2', 'Cebu', 'Cebu City', 'https://www.google.com/travel/search?q=Sirao%20Garden%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaVQo3EjUyJTB4MzNhOWExMGZhZTg1YmYxZjoweDVhOTI5ZmI3Yjk5ZTFmNzE6DFNpcmFvIEdhcmRlbhIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAEyKENob1F3TVhReE1fWjM1blVBUm9OTDJjdk1URjNPREF6YmpkdWJCQUM4BkIJEUT0hlYEuBXSQgkR8RdEq-ZXU-1CCREIJaHRDkncy1pcCAEyWKoBVRABKhEiDWFjY29tbW9kYXRpb24oADIeEAEiGjLW7V9eHtUObOxf8q2Z90Gd8n1-fTV-h9WlMh4QAiIac2lyYW8gZ2FyZGVuIGFjY29tbW9kYXRpb24&ap=KigKEglxzNkABpQkQBFJtjT9l_ReQBISCSyjgUrsBCVAEUm2NP3r-l5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQjwQ', 'Nature & outdoors (mountains, beaches, national parks)', 2293, 32),
('Budget', '2', 'Cebu', 'Cebu City', 'https://www.google.com/travel/search?q=Sirao%20Garden%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaVQo3EjUyJTB4MzNhOWExMGZhZTg1YmYxZjoweDVhOTI5ZmI3Yjk5ZTFmNzE6DFNpcmFvIEdhcmRlbhIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAESBENCST0yKENob0lzYmV6cGQ3anBhMjVBUm9OTDJjdk1URnNaR1pxZERNemF4QUI4BkIJEUT0hlYEuBXSQgkR8RdEq-ZXU-1CCREIJaHRDkncy0gAWlwIATJYqgFVEAEqESINYWNjb21tb2RhdGlvbigAMh4QASIaMtbtX14e1Q5s7F_yrZn3QZ3yfX59NX6H1aUyHhACIhpzaXJhbyBnYXJkZW4gYWNjb21tb2RhdGlvbg&ap=KigKEglxzNkABpQkQBFJtjT9l_ReQBISCSyjgUrsBCVAEUm2NP3r-l5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQnAo', 'Urban (cities, shopping, nightlife)', 1398, 33),
('Budget', '2', 'Cebu', 'Cebu City', 'https://www.google.com/travel/search?q=Sirao%20Garden%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaVQo3EjUyJTB4MzNhOWExMGZhZTg1YmYxZjoweDVhOTI5ZmI3Yjk5ZTFmNzE6DFNpcmFvIEdhcmRlbhIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAESBENCST0yKENob0kyLVhsNGJIMTg0aVJBUm9OTDJjdk1URnpNemswTkRCeGJoQUI4BkIJEUT0hlYEuBXSQgkR8RdEq-ZXU-1CCREIJaHRDkncy0gAWlwIATJYqgFVEAEqESINYWNjb21tb2RhdGlvbigAMh4QASIaMtbtX14e1Q5s7F_yrZn3QZ3yfX59NX6H1aUyHhACIhpzaXJhbyBnYXJkZW4gYWNjb21tb2RhdGlvbg&ap=KigKEgl7UtgPE3gkQBFvEoPAIPdeQBISCaG-ZWP-6CRAEW8Sg8B0_V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQ5RE', 'Urban (cities, shopping, nightlife)', 1296, 34),
('Luxury', '2', 'Cebu', 'Cebu ocean park', 'https://www.google.com/travel/search?q=Cebu%20ocean%20park%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaWAo6EjgyJTB4MzNhOTlkMDYzYTQ5OTI0YjoweDJhM2Y2NWY1ZTc4YzlhNTA6D0NlYnUgT2NlYW4gUGFyaxIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMihDaG9JbHJmNXFlbnczcy1EQVJvTkwyY3ZNVEZ6WDNsMGNEZ3hZaEFCOA1IAA&ap=KigKEgm3y04M1ogkQBFAjz_n_fdeQBISCVAqpjL0liRAEUCPP2fI-F5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQ4BI', 'Urban (cities, shopping, nightlife)', 10840, 35),
('Budget', '2', 'Cebu', 'Cebu ocean park', 'https://www.google.com/travel/search?q=Cebu%20ocean%20park%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaWAo6EjgyJTB4MzNhOTlkMDYzYTQ5OTI0YjoweDJhM2Y2NWY1ZTc4YzlhNTA6D0NlYnUgT2NlYW4gUGFyaxIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMidDaGtJdHVfSzE5Zjd3OUVhR2cwdlp5OHhNV00xY1Y4M2NEWm1FQUU4DUgA&ap=KigKEgk3DXY7iJUkQBHG_NyQL_leQBISCTIQFhmmoyRAEcb83BD6-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQ0RQ', 'Urban (cities, shopping, nightlife)', 605, 36),
('Mid', '2', 'Cebu', 'Cebu ocean park', 'https://www.google.com/travel/search?q=Cebu%20ocean%20park%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaWAo6EjgyJTB4MzNhOTlkMDYzYTQ5OTI0YjoweDJhM2Y2NWY1ZTc4YzlhNTA6D0NlYnUgT2NlYW4gUGFyaxIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMidDaGtJODVqWXVwak5xcWwxR2cwdlp5OHhNV1o0ZG5oNVpuTXlFQUU4DUgA&ap=KigKEgk3DXY7iJUkQBHG_NyQL_leQBISCTIQFhmmoyRAEcb83BD6-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQ0xg', 'Urban (cities, shopping, nightlife)', 2239, 37),
('Mid', '2', 'Cebu', 'Cebu ocean park', 'https://www.google.com/travel/search?q=Cebu%20ocean%20park%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaWAo6EjgyJTB4MzNhOTlkMDYzYTQ5OTI0YjoweDJhM2Y2NWY1ZTc4YzlhNTA6D0NlYnUgT2NlYW4gUGFyaxIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMihDaG9JdnMyTHE4S1V6OXFIQVJvTkwyY3ZNVEZzTW5Cb2NXTXdZeEFCOA1IAA&ap=KigKEgkZmVK5tZEkQBFTjahaBfheQBISCVWp26zTnyRAEVONqNrP-F5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQshw', 'Urban (cities, shopping, nightlife)', 1987, 38),
('Budget ', '2', 'Cebu', 'Cebu ocean park', 'https://www.google.com/travel/search?q=Cebu%20ocean%20park%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaWAo6EjgyJTB4MzNhOTlkMDYzYTQ5OTI0YjoweDJhM2Y2NWY1ZTc4YzlhNTA6D0NlYnUgT2NlYW4gUGFyaxIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAASBENCST0gACgAMidDaGtJbk56UDlkckhoZnRWR2cwdlp5OHhNWFJ1WW0wMU5HSnRFQUU4DUgA&ap=KigKEgkF0JegCZwkQBGnVnBJCPleQBISCc0f5FgnqiRAEadWcMnS-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQlB8', 'Urban (cities, shopping, nightlife)', 947, 39),
('Mid', '2', 'Cebu', 'Taoist temple', 'https://www.google.com/travel/search?q=Taoist%20temple%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaQAoiEiAKCi9tLzA0MTJ6OXc6EkNlYnUgVGFvaXN0IFRlbXBsZRIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMihDaG9JeV9la25hUDgxNUhfQVJvTkwyY3ZNVEZuZVRSdWVuTXpPUkFCOA1IAA&ap=KigKEgk7uBGxNaYkQBFe_p4TLvleQBISCaW5I3pErSRAEV7-nlOT-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQhyI', 'Urban (cities, shopping, nightlife)', 1209, 40),
('Mid', '2', 'Cebu', 'Taoist temple', 'https://www.google.com/travel/search?q=Taoist%20temple%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaQAoiEiAKCi9tLzA0MTJ6OXc6EkNlYnUgVGFvaXN0IFRlbXBsZRIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMihDaG9JX011Rjc4ZUVpSWpsQVJvTkwyY3ZNVEZvWW1kb2EyeHFNUkFCOA1IAA&ap=KigKEgk7uBGxNaYkQBFe_p4TLvleQBISCaW5I3pErSRAEV7-nlOT-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQoSQ', 'Urban (cities, shopping, nightlife)', 1415, 41),
('Mid', '2', 'Cebu', 'Taoist temple', 'https://www.google.com/travel/search?q=Taoist%20temple%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaQAoiEiAKCi9tLzA0MTJ6OXc6EkNlYnUgVGFvaXN0IFRlbXBsZRIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAAgACgAMiRDaGNJcUpYRnhxR2g3THJKQVJvS0wyMHZNRzVpTW1NNGVSQUI4DUgA&ap=KigKEgketCJ8BpEkQBGgFG5sR_deQBISCfRbMnN8ySRAEaAUbmxx-l5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQrSw', 'Urban (cities, shopping, nightlife)', 3534, 42),
('Mid', '2', 'Cebu', 'Taoist temple', 'https://www.google.com/travel/search?q=Taoist%20temple%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaQgoiEiAKCi9tLzA0MTJ6OXc6EkNlYnUgVGFvaXN0IFRlbXBsZRIcEhQKBwjoDxAMGBgSBwjoDxAMGBkYATIECAAQACoHCgU6A1BIUA&qs=CAAgACgAMihDaG9JNUszNTN1WHduOEw0QVJvTkwyY3ZNVEYyTmpkbWRHaHVkaEFCOA1IAA&ap=KigKEgketCJ8BpEkQBGgFG5sR_deQBISCfRbMnN8ySRAEaAUbmxx-l5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQtS8', 'Urban (cities, shopping, nightlife)', 2101, 43),
('Mid', '2', 'Cebu', 'Taoist temple', 'https://www.google.com/travel/search?q=Taoist%20temple%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaWwo9EjsyJTB4MzNhOTk5MmIxYjBjOTdmMToweGZhYmY1MjA4NDQwMTQ5ODc6EkNlYnUgVGFvaXN0IFRlbXBsZRIaEhQKBwjoDxAMGBgSBwjoDxAMGBkYATICEAAqBwoFOgNQSFA&qs=CAASBENCST0gACgAMiZDaGdJaDkzWnF0cmJ0Y1RNQVJvTEwyY3ZNWFJ0ZUhRemNUSVFBUTgNSAA&ap=KigKEgketCJ8BpEkQBGgFG5sR_deQBISCfRbMnN8ySRAEaAUbmxx-l5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQkTM', 'Urban (cities, shopping, nightlife)', 2321, 44),
('Mid', '2', 'Cebu', 'Temple of Leah', 'https://www.google.com/travel/search?q=template%20of%20leah%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaPwohEh8KDS9nLzExYndwcnQ4bTQ6DlRlbXBsZSBPZiBMZWFoEhoSFAoHCOgPEAwYGBIHCOgPEAwYGRgBMgIQACoHCgU6A1BIUA&qs=CAAgACgAMiRDaGNJclBYejI0RzMtWlk5R2dzdlp5OHhkR1k0Tkcxb2RoQUI4DUgA&ap=KigKEglpwCU7bKAkQBHfln7YmfleQBISCRaW1xR7pyRAEd-Wfhj_-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQ_zQ', 'Urban (cities, shopping, nightlife)', 2775, 45),
('Mid', '2', 'Cebu', 'Temple of Leah', 'https://www.google.com/travel/search?q=template%20of%20leah%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaVwo5EjcyJTB4MzNhOTlmNWFiZTU1MDUzZjoweGVhMmViYjRmNWIxODRmZjI6DlRlbXBsZSBPZiBMZWFoEhoSFAoHCOgPEAwYGBIHCOgPEAwYGRgBMgIQACoHCgU6A1BIUA&qs=CAASBENCST0gACgAMiZDaGdJM09EbWc5YjAxb2lFQVJvTEwyY3ZNWFJ0TURoaWJXUVFBUTgNSAA&ap=KigKEglWaCLZb6skQBHApnNKPfleQBISCfFLLJN-siRAEcCmc4qi-V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQjjg', 'Urban (cities, shopping, nightlife)', 4309, 46),
('Mid', '2', 'Cebu', 'Temple of Leah', 'https://www.google.com/travel/search?q=template%20of%20leah%20cebu%20accommodation&g2lb=4965990%2C4969803%2C72277293%2C72302247%2C72317059%2C72406588%2C72414906%2C72421566%2C72471280%2C72472051%2C72481459%2C72485658%2C72499705%2C72560029%2C72573224%2C72614662%2C72616120%2C72619927%2C72647020%2C72648289%2C72658035%2C72686036%2C72760082%2C72803964%2C72808078%2C72832976&hl=en-PH&gl=ph&ssta=1&ts=CAESCgoCCAMKAggDEAAaVwo5EjcyJTB4MzNhOTlmNWFiZTU1MDUzZjoweGVhMmViYjRmNWIxODRmZjI6DlRlbXBsZSBPZiBMZWFoEhoSFAoHCOgPEAwYGBIHCOgPEAwYGRgBMgIQACoHCgU6A1BIUA&qs=CAASBENCST0gACgAMiZDaGdJcmVDRC12YlZucGh2R2d3dlp5OHhhR00zTW01a01Hb1FBUTgNSAA&ap=KigKEgltblfa_Z8kQBGCY8_-mPleQBISCfIqRrUMpyRAEYJjzz7--V5AMABoAQ&ictx=111&ved=0CAAQ5JsGahgKEwj4yY6dyrGKAxUAAAAAHQAAAAAQlDs', 'Urban (cities, shopping, nightlife)', 2861, 47),
('Luxury', '1', 'Boracay', 'Boracay island', 'Aqua Boracay, Malay Hotels - Skyscanner', 'Nature & outdoors (mountains, beaches, national parks)', 14330, 48),
('Luxury', '1', 'Boracay', 'Boracay island', 'Henann Lagoon Resort, Malay Hotels - Skyscanner', 'Nature & outdoors (mountains, beaches, national parks)', 14789, 49),
('Luxury', '1', 'Boracay', 'Boracay island', 'Henann Crystal Sands Resort, Malay Hotels - Skyscanner', 'Nature & outdoors (mountains, beaches, national parks)', 9277, 50),
('Mid', '1', 'Boracay', 'Boracay island', 'Marzon Beach Resort - Boracay, Malay Hotels - Skyscanner', 'Nature & outdoors (mountains, beaches, national parks)', 3386, 51),
('Budget', '1', 'Boracay', 'Boracay island', 'Ocean Breeze Inn, Malay Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 1172, 52),
('Budget', '1', 'Boracay', 'Boracay island', 'OYO 876 Escurel Inn Boracay, Malay Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 1454, 53),
('Budget', '1', 'Boracay', 'Boracay island', 'Turtle Inn Resort, Malay Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 2480, 54),
('Mid', '1', 'Boracay', 'Boracay island', 'Lingganay Boracay Hotel Resort, Malay Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 3053, 55),
('Luxury', '1', 'Boracay', 'Boracay island', 'Azalea Hotels & Residences Boracay, Balabag Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 4824, 56),
('Luxury', '1', 'Boracay', 'Boracay island', 'Astoria Current, Malay Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 9198, 57),
('Luxury', '1', 'Boracay', 'Boracay island', 'Mandarin Bay Resort & Spa, Balabag Hotels - Skyscanner', 'Urban (cities, shopping, nightlife)', 9233, 58);

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `AttractionID` varchar(100) NOT NULL,
  `ActivityName` varchar(100) NOT NULL,
  `Profile` varchar(100) NOT NULL,
  `TravelerPreference` varchar(100) NOT NULL,
  `Pacing` varchar(100) NOT NULL,
  `Environment` varchar(100) NOT NULL,
  `Transportation` varchar(100) NOT NULL,
  `Fee` float NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`AttractionID`, `ActivityName`, `Profile`, `TravelerPreference`, `Pacing`, `Environment`, `Transportation`, `Fee`, `id`) VALUES
('Pal-1', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 800, 1),
('Pal-1', 'Kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 600, 2),
('Pal-2', 'Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 2500, 3),
('Pal-2', 'Swimming', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 4),
('Pal-2', 'Island Hopping', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1500, 5),
('Pal-2', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 6),
('Pal-2', 'Kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 600, 7),
('Pal-3', 'Relaxing', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 100, 8),
('Pal-3', 'Swimming', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 9),
('Pal-3', 'Island Hopping', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1500, 10),
('Pal-3', 'Rock Climbing', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 1200, 11),
('Pal-3', 'Hiking', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 400, 12),
('Pal-4', 'Canopy walk', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 500, 13),
('Pal-4', 'Trekking', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 400, 14),
('Pal-4', 'scenic view of 360 degree', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Public transport', 300, 15),
('Pal-4', 'Ziplining', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 1000, 16),
('Pal-4', 'Beach Lounging', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 17),
('Pal-5', 'Swimming', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 18),
('Pal-5', 'Sunset viewing', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 19),
('Pal-5', 'beachside resto and bar', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 20),
('Pal-5', 'Kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 600, 21),
('Pal-5', 'Swimming', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 22),
('Pal-6', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 23),
('Pal-6', 'Scenic boat tour', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1200, 24),
('Pal-6', 'Paddleboarding', 'Adventure and activities', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 25),
('Pal-6', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 26),
('Pal-6', 'Kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 600, 27),
('Pal-7', 'Swimming', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 28),
('Pal-7', 'Cliff jumping', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 500, 29),
('Pal-7', 'Scuba diving (famous for its thermocline, with dramatic shifts in water temperature)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 3500, 30),
('Pal-7', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 31),
('Pal-8', 'Swimming', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 32),
('Pal-8', 'Cliff diving (in designated safe areas)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 500, 33),
('Pal-8', 'Hiking (up 700+ steps to the summit)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 400, 34),
('Pal-8', 'Photography (especially at sunset)', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Public transport', 500, 35),
('Pal-9', 'Scenic views of Coron town and bay', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Public transport', 300, 36),
('Pal-9', 'Cave exploration', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 1200, 37),
('Pal-9', 'Kayaking (inside the cave\'s underground lake)', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 38),
('Pal-10', 'Photography (inside the cave and the unique lake)', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 500, 39),
('Pal-10', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 40),
('Pal-10', 'Swimming', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 41),
('Pal-11', 'Underground river boat tour (through the world’s longest navigable underground river)', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Public transport', 2000, 42),
('Pal-11', 'Wildlife spotting (monkeys, monitor lizards, etc.)', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Public transport', 500, 43),
('Pal-12', 'Photography of the stunning limestone karst landscapes and caves', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 500, 44),
('Pal-12', 'Island-hopping (visit Starfish Island, Pandan Island, Luli Island, etc.)', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 2000, 45),
('Pal-12', 'Snorkeling and swimming', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 1000, 46),
('Pal-13', 'Kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 600, 47),
('Pal-13', 'Fishing (in some areas)', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 800, 48),
('Pal-13', 'Sunbathing and relaxing on the beach', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 200, 49),
('Pal-13', 'Food tasting (famous for baked goods like hopia)', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 800, 50),
('Pal-13', 'Garden and park exploration', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 400, 51),
('Pal-14', 'Playground activities for kids', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 300, 52),
('Pal-14', 'Photography (lots of fun, quirky spots for photos)', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 500, 53),
('Pal-14', 'Souvenir shopping', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 200, 54),
('Pal-14', 'Crocodile viewing (various sizes from young hatchlings to large crocodiles)', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Private transfers', 300, 55),
('Pal-14', 'Educational tour about wildlife conservation', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Public transport', 600, 56),
('Pal-15', 'Photography with crocodiles (safely behind barriers)', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Public transport', 500, 57),
('Pal-15', 'Exploration of the wildlife center, which houses other animals like bearcats and birds', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Public transport', 400, 58),
('Pal-15', 'Spelunking (cave exploration)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 1000, 59),
('Pal-15', 'Rock climbing (up Ugong Rock)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 1200, 60),
('Pal-16', 'Ziplining (fast descent from the top of Ugong Rock)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 1000, 61),
('Pal-16', 'Photography (with panoramic views after the climb)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 500, 62),
('Ceb-1', 'Explore the Celosia Flower Fields', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 63),
('Ceb-1', 'Take Photos at the Iconic Windmill', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 300, 64),
('Ceb-1', 'Relax in the Balinese-inspired Huts', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 400, 65),
('Ceb-1', 'Enjoy the \"Hand of Cebu\"', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 66),
('Ceb-2', 'Camping at Sirao Pictorial Garden and Camping Site', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 67),
('Ceb-2', 'Oceanarium Walk', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 600, 68),
('Ceb-2', 'Fish Spa', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 400, 69),
('Ceb-2', 'Interaction with Stingrays', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 70),
('Ceb-2', 'Bird Feeding', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 71),
('Ceb-3', 'Aqua Dining', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 72),
('Ceb-3', 'Climb the Grand Staircase', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 73),
('Ceb-3', 'Explore the Main Prayer Hall', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 300, 74),
('Ceb-3', 'Enjoy the Panoramic Views of Cebu City', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 75),
('Ceb-3', 'Visit the Miniature Great Wall Replica', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Rent a car or motorbike', 300, 76),
('Ceb-4', 'Marvel at the Dragon Statues', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 200, 77),
('Ceb-4', 'Admire the Grand Staircase and Fountain', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 200, 78),
('Ceb-4', 'Explore the Main Hall and Statue of Leah', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 400, 79),
('Ceb-4', 'Visit the Temple Museum', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 300, 80),
('Ceb-4', 'Appreciate the Art and Sculptures', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 200, 81),
('Ceb-5', ' Relax in the Open-Air Courtyards', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 82),
('Ceb-5', 'Visit the Heritage of Cebu Monument', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 400, 83),
('Ceb-5', 'Casa Gorordo Museum', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 400, 84),
('Ceb-5', 'Yap-Sandiego Ancestral House', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 300, 85),
('Ceb-5', 'Colon Street', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Urban', 'Rent a car or motorbike', 200, 86),
('Ceb-6', 'Basilica Minore del Santo Niño and Magellan’s Cross', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Rent a car or motorbike', 800, 87),
('Ceb-6', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 88),
('Ceb-6', 'Scuba Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 89),
('Ceb-6', 'Stand-Up Paddleboarding (SUP)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 1500, 90),
('Ceb-6', 'Island Hopping', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 600, 91),
('Ceb-7', 'Kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 92),
('Ceb-7', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 93),
('Ceb-7', 'Beach Relaxation', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 100, 94),
('Ceb-7', 'Caohagan Island Chapel', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Rent a car or motorbike', 800, 95),
('Ceb-7', 'Island Village Tour', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Rent a car or motorbike', 1500, 96),
('Ceb-8', 'Fishing or Relaxing on a Floating Restaurant', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 97),
('Ceb-8', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 98),
('Ceb-8', 'Scuba Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 99),
('Ceb-8', 'Gilutongan Island Beachfront', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 2000, 100),
('Ceb-8', 'Spa Treatment', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 1500, 101),
('Ceb-9', 'Traditional Filipino Beachfront Dining', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 102),
('Ceb-9', 'Olango Island Wildlife Sanctuary', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 103),
('Ceb-9', 'Sunset Viewing at Santa Rosa Beach', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 104),
('Ceb-9', 'Diving at Hilutungan Island Marine Sanctuary', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 105),
('Ceb-9', 'Visit the Sacred Heart Parish Church', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Rent a car or motorbike', 500, 106),
('Ceb-10', 'Explore the Olango Island Mangrove Forest', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 1000, 107),
('Ceb-10', 'Snorkeling at the Coral Gardens', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 108),
('Ceb-10', 'Scuba Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 600, 109),
('Ceb-10', 'Kayaking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 110),
('Ceb-10', 'Mangrove Exploration', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 111),
('Ceb-11', 'Beach Relaxation', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 112),
('Ceb-11', 'Swimming and Waterfall Bathing', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 113),
('Ceb-11', 'Guided Waterfall Trekking', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 114),
('Ceb-11', 'Hammock Relaxation (at nearby resorts)', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Urban', 'Rent a car or motorbike', 800, 115),
('Ceb-12', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 3500, 116),
('Ceb-12', 'Whale Shark Scuba Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 1500, 117),
('Ceb-12', 'Feeding the Whale Sharks (Observation Only)', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 600, 118),
('Ceb-12', 'Kayaking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 119),
('Ceb-13', 'Kayaking and Paddleboarding', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 120),
('Ceb-13', 'Relaxing on the White Sand Beach', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 121),
('Ceb-13', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 122),
('Ceb-13', 'Scuba Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 123),
('Ceb-14', 'Island Trekking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 400, 124),
('Ceb-14', 'Visit the Museo Oslob', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Balanced', 'Historical', 'Rent a car or motorbike', 200, 125),
('Ceb-14', 'Stroll around the Oslob Plaza', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Rent a car or motorbike', 400, 126),
('Ceb-14', 'Explore the historical ruins and museum exhibits.', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Rent a car or motorbike', 300, 127),
('Ceb-15', 'Explore the Historic Watchtower', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 128),
('Ceb-15', 'Relax in Baluarte Ruins Grounds', 'Relaxing', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 129),
('Bor-1', 'Canyoneering', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 130),
('Bor-1', 'Water Activities', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 1200, 131),
('Bor-1', 'Outdoor & Adventure Activities', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 132),
('Bor-2', 'Mangrove Walks', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 133),
('Bor-2', 'Swimming and Wading', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 134),
('Bor-2', 'mangrove planting', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 600, 135),
('Bor-2', 'Kayaking and Boating', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Rent a car or motorbike', 400, 136),
('Bor-2', 'Relaxation in Treehouses', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 1000, 137),
('Bor-3 ', 'Cave Adventure', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Rent a car or motorbike', 500, 138),
('Bor-3 ', 'Swim in the Waterfalls', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 400, 139),
('Bor-3 ', 'Trekking and Nature Walks', 'Cultural experiences', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 300, 140),
('Bor-3 ', 'Bayanihan Activities', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Urban', 'Private transfers', 500, 141),
('Bor-3 ', 'Hot Springs', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 200, 142),
('Bor-4', 'Swimming  ', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 400, 143),
('Bor-4', 'Trekking ', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Public transport', 500, 144),
('Bor-5', 'Cliff Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 800, 145),
('Bor-5', 'Snorkeling', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 600, 146),
('Bor-5', 'Kayaking', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 800, 147),
('Bor-5', 'Stand-Up Paddleboarding (SUP)', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 148),
('Bor-5', 'Swimming ', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 800, 149),
('Bor-6', 'banana boat ride', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Public transport', 3000, 150),
('Bor-6', 'Snorkeling and Diving', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 3000, 151),
('Bor-6', 'parasailing', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 2500, 152),
('Bor-6', 'kite surfing', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 2000, 153),
('Bor-6', 'windsurfing', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 800, 154),
('Bor-7', 'Snorkeling', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 155),
('Bor-7', 'swimming ', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 400, 156),
('Bor-8', 'Hiking', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 157),
('Bor-8', 'Trycycle Ride to the Top', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 1500, 158),
('Bor-8', 'ATV Ride (All-Terrain Vehicle)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 500, 159),
('Bor-8', 'Biking', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 1000, 160),
('Bor-8', 'Zipline (Seasonal)', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 200, 161),
('Bor-9', 'Chapel Visiting', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Public transport', 400, 162),
('Bor-9', 'Tide Pool Exploration(Low Tide)', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 163),
('Bor-9', 'Snorkeling (Nearby Waters)', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1000, 164),
('Bor-10', 'Exploring Caves', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Public transport', 500, 165),
('Bor-10', 'Snorkeling and Swimming', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1000, 166),
('Bor-10', 'Kayaking and Paddleboarding', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1200, 167),
('Bor-10', 'Boat Tours Around the Island', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Public transport', 1000, 168),
('Boh-1', 'Caving', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Private transfers', 1000, 169),
('Boh-1', 'Sky Ride', 'Adventure and activities', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 800, 170),
('Boh-1', 'Waterfall Chasing', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Private transfers', 1200, 171),
('Boh-1', 'Root Climbing & Rappelling', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Historical', 'Private transfers', 1000, 172),
('Boh-1', 'Suislide', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Private transfers', 400, 173),
('Boh-2', 'Binabaje Hills of Bgy', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Private transfers', 500, 174),
('Boh-2', 'Canumantad Falls', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Private transfers', 400, 175),
('Boh-2', 'Cadapdapan Rice Terraces', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Private transfers', 200, 176),
('Boh-2', 'Anda Beach', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Private transfers', 400, 177),
('Boh-3', 'Baclayon Church Museum', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Private transfers', 500, 178),
('Boh-3', 'Philippine Tarsier and Wildlife Sanctuary', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 1200, 179),
('Boh-3', 'Loboc River Cruise', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Private transfers', 400, 180),
('Boh-3', 'Bohol Habitat Conservation', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 400, 181),
('Boh-3', 'Bohol Phyton and Wildlife', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 500, 182),
('Boh-3', 'Chocolate Hills Natural Monument', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 200, 183),
('Boh-4', 'Blood Compact Monument', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Balanced', 'Historical', 'Private transfers', 200, 184),
('Boh-4', 'Baclayon Church', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Private transfers', 500, 185),
('Boh-4', 'Bohol Python and Wildlife Park', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 1500, 186),
('Boh-4', 'Bohol Island', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 200, 187),
('Boh-4', 'St Peter\'s Church', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Private transfers', 200, 188),
('Boh-5', 'Bohol Provincial Capitol', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Public transport', 200, 189),
('Boh-5', 'Plaza Rizal', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Urban', 'Public transport', 200, 190),
('Boh-5', 'Bohol Cathedral', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Historical', 'Public transport', 400, 191),
('Boh-5', 'Bohol Museum', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Public transport', 300, 192),
('Boh-5', 'Central Public Market', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Public transport', 1500, 193),
('Boh-6', 'Island Hopping', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Private transfers', 2500, 194),
('Boh-6', 'Snorkeling and Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Private transfers', 500, 195),
('Boh-6', 'Visit Hinagdanan Cave', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Historical', 'Private transfers', 200, 196),
('Boh-6', 'Beach Relaxation at Alona Beach', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Urban', 'Private transfers', 2000, 197),
('Boh-6', 'Tarsier Sanctuary and Chocolate Hills Tour', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Historical', 'Private transfers', 1000, 198),
('Boh-7', 'Relaxation at Private Beach', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Private transfers', 2000, 199),
('Boh-7', 'Spa and Wellness', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Private transfers', 800, 200),
('Boh-7', 'Seafood Restaurant Visitation', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Urban', 'Private transfers', 500, 201),
('Boh-7', 'Evening Entertainment', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Private transfers', 300, 202),
('Boh-7', 'Billiards and Table Tennis', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Urban', 'Private transfers', 800, 203),
('Boh-7', 'Farm Tours', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 800, 204),
('Boh-8', 'Go-Kart Racing', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Private transfers', 1000, 205),
('Boh-8', 'Double Go-Kart Rides', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Private transfers', 500, 206),
('Boh-8', 'Archery', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Private transfers', 800, 207),
('Boh-8', 'Family-friendly Rides', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 500, 208),
('Boh-8', 'Photography and Social Time', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Urban', 'Private transfers', 2500, 209),
('Boh-9', 'Golf', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 500, 210),
('Boh-9', 'Putting and Chipping Green', 'Cultural experiences', 'Very open, the more exciting the better', 'Slow paced', 'Historical', 'Private transfers', 400, 211),
('Boh-9', 'Ping Pong and Dart', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Urban', 'Private transfers', 800, 212),
('Boh-9', 'Obstacle Course', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 1000, 213),
('Boh-9', 'Dining and Karaoke', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Urban', 'Private transfers', 200, 214),
('Boh-10', 'Drink from the Healing Well', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Balanced', 'Historical', 'Public transport', 400, 215),
('Boh-10', 'Explore the Church’s Architecture', 'City exploration', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Public transport', 100, 216),
('Boh-10', 'Attend Mass', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Public transport', 400, 217),
('Boh-10', 'Learn About Local History and Miracles', 'Cultural experiences', 'Very open, the more exciting the better', 'Balanced', 'Historical', 'Public transport', 200, 218),
('Boh-11', 'swimming', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 300, 219),
('Boh-11', 'Sunbathe or relax', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 200, 220),
('Boh-11', 'Beachcombing and collecting shells', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 500, 221),
('Boh-11', 'picnic with a scenic ocean view', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 300, 222),
('Boh-11', 'Seeing stunning sunset', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 200, 223),
('Boh-12', 'Swimming', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 400, 224),
('Boh-12', 'Explore the rock formations', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Historical', 'Private transfers', 500, 225),
('Boh-12', 'Dive from the edges of the cave pool', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Private transfers', 300, 226),
('Boh-12', 'Relax and cool down', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 800, 227),
('Boh-12', 'guided tour', 'Adventure and activities', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Private transfers', 1000, 228),
('Boh-13', 'guided tour', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Private transfers', 800, 229),
('Boh-13', 'Explore mystical rock formations and caves', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Balanced', 'Historical', 'Private transfers', 500, 230),
('Boh-13', 'Bohol\'s history as the \"cradle of civilization.\"', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Private transfers', 600, 231),
('Boh-13', 'cultural storytelling sessions about Anda\'s history.', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Private transfers', 400, 232),
('Boh-13', 'paddle through mangroves and lagoons', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 800, 233),
('Boh-14', 'Swim or relax in the natural pool', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 1000, 234),
('Boh-14', 'Marvel at the enchanting stalactites and stalagmites', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 1000, 235),
('Boh-14', 'Meditate or enjoy a peaceful retreat', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 236),
('Boh-14', 'Cave Exploration', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 400, 237),
('Boh-14', 'Sight seeing with the rock formations', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 238),
('Boh-15', 'Trekking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Private transfers', 500, 239),
('boh-15', 'Swimming', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Fast', 'Nature and Outdoors', 'Private transfers', 400, 240),
('Boh-15', 'Picnic', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 300, 241),
('boh-15', 'Learn about the local flora and fauna', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Private transfers', 700, 242),
('Boh-15', 'Sight Seeing', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 400, 243),
('Dav-1', 'Chocolate Museum Tour', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Public transport', 800, 244),
('Dav-1', 'Interactive Bird Show', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 2000, 245),
('Dav-1', 'Calesa & Horseback Riding', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1500, 246),
('Dav-1', 'Chocolate Spa', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 500, 247),
('Dav-1', 'Chocolate Making', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Public transport', 800, 248),
('Dav-2', 'Explore the Tunnel', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Historical', 'Public transport', 500, 249),
('Dav-2', 'Cultural Exploration', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Historical', 'Public transport', 1500, 250),
('Dav-2', 'Photography', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Historical', 'Public transport', 500, 251),
('Dav-2', 'Dining Experience (they have a restaurant)', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Urban', 'Public transport', 400, 252),
('Dav-3', 'Camping', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 400, 253),
('Dav-3', 'Hiking', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 300, 254),
('Dav-4', 'Museum Tour', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Private transfers', 400, 255),
('Dav-5', 'Bamboo Maze', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 1000, 256),
('Dav-5', 'Butterfly Garden', 'Relaxing', 'I prefer laid back, relaxing experience', 'Balanced', 'Nature and Outdoors', 'Public transport', 1000, 257),
('Dav-5', 'Skyrider', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 1500, 258),
('Dav-5', 'Skyswing', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 800, 259),
('Dav-5', 'Indiana Jones', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 2500, 260),
('Dav-6', 'TAKLOBO AND CORAL TOURS (Snorkeling)', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 2500, 261),
('Dav-6', 'Jet Skiing', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 3000, 262),
('Dav-6', 'Scuba Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 1000, 263),
('Dav-6', 'Parasailing', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 500, 264),
('Dav-6', 'PEARL FARM BUTIK AND CAFE (Enjoying a café experience)', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Public transport', 200, 265),
('Dav-7', 'Water Slide', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Public transport', 2500, 266),
('Dav-7', 'Swimming', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 500, 267),
('Dav-7', 'SCUBA diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Public transport', 600, 268),
('Dav-7', 'canopy walk', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 800, 269),
('Dav-7', 'kayaking', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 270),
('Dav-8', 'Banana boat', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 271),
('Dav-8', 'Swimming ', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 600, 272),
('Dav-8', 'Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 273),
('Dav-8', 'Kayaking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 274),
('Dav-8', 'Jet Skiing', 'Adventure and activities', 'Very open, the more exciting the better', 'Fast', 'Nature and Outdoors', 'Rent a car or motorbike', 400, 275),
('Dav-9', 'Guided Tour', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 276),
('Dav-9', 'Bat Conservation Education', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 200, 277),
('Dav-9', 'Bat Watching', 'Cultural experiences', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 2500, 278),
('Dav-10', 'Swimming', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 400, 279),
('Dav-10', 'Diving', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 500, 280),
('Dav-10', 'Nature Appreciation', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 200, 281),
('Dav-12', 'Biking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 500, 282),
('Dav-12', 'Jogging and Walking', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 300, 283),
('Dav-12', 'Sports', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Public transport', 200, 284),
('Dav-12', 'Picnicking', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Public transport', 300, 285),
('Dav-13', 'Swimming', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 600, 286),
('Dav-13', 'Beach Volleyball', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 800, 287),
('Dav-13', 'Kayaking', 'Adventure and activities', 'Very open, the more exciting the better', 'Balanced', 'Nature and Outdoors', 'Private transfers', 1000, 288),
('Dav-13', 'Snorkeling', 'Adventure and activities', 'Very open, the more exciting the better', 'Slow paced', 'Nature and Outdoors', 'Private transfers', 800, 289),
('Dav-13', 'Barbecue and Dining', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Private transfers', 500, 290),
('Dav-14', 'Shop for Clothes and Accessories', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Public transport', 800, 291),
('Dav-14', 'Explore Street Food Stalls', 'Relaxing', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Public transport', 500, 292),
('Dav-14', 'Buy Local Products and Souvenirs', 'City exploration', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Urban', 'Public transport', 1200, 293),
('Dav-14', 'Enjoy Live Music or Performances', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Urban', 'Public transport', 500, 294);
INSERT INTO `activities` (`AttractionID`, `ActivityName`, `Profile`, `TravelerPreference`, `Pacing`, `Environment`, `Transportation`, `Fee`, `id`) VALUES
('Dav-15', 'Scenic River Cruise', 'Adventure and activities', 'I prefer moderate activities, nothing too extreme', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 800, 295),
('Dav-15', 'Mangrove Forest Walk', 'Relaxing', 'I prefer laid back, relaxing experience', 'Slow paced', 'Nature and Outdoors', 'Rent a car or motorbike', 500, 296),
('Dav-15', 'Floating Market (Floating Tiangge)', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 900, 297),
('Dav-15', 'Wildlife and Nature Watching', 'Cultural experiences', 'I prefer moderate activities, nothing too extreme', 'Balanced', 'Nature and Outdoors', 'Rent a car or motorbike', 1200, 298);

-- --------------------------------------------------------

--
-- Table structure for table `boholattractions`
--

CREATE TABLE `boholattractions` (
  `AttractionID` char(6) NOT NULL,
  `Municipality` varchar(100) NOT NULL,
  `Attraction` varchar(255) NOT NULL,
  `PopularSecluded` varchar(50) NOT NULL,
  `Budget` varchar(50) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boholattractions`
--

INSERT INTO `boholattractions` (`AttractionID`, `Municipality`, `Attraction`, `PopularSecluded`, `Budget`, `id`) VALUES
('Boh-1', 'Tagbilaran City', 'Danao  Adventure Park', 'Popular', 'Luxury', 1),
('Boh-10', 'Panglao', 'The Church of Our Lady of the Assumption', 'Popular', 'Mid-range', 2),
('Boh-11', 'Anda', 'Quinale Beach', 'Popular', 'Budget', 3),
('Boh-12', 'Anda', 'Cabagnow Cave Pool', 'Popular', 'Mid-range', 4),
('Boh-13', 'Anda', 'Lamanok Island', 'Popular', 'Mid-range', 5),
('Boh-14', 'Anda', 'Combento Cave', 'Popular', 'Budget', 6),
('Boh-15', 'Anda', 'Can-Umantad Falls', 'Popular', 'Luxury', 7),
('Boh-2', 'Tagbilaran City', 'Alice Panoramic Park', 'Popular', 'Luxury', 8),
('Boh-3', 'Tagbilaran City', 'Chocolate Hills and Laboc Cruise', 'Popular', 'Luxury', 9),
('Boh-4', 'Tagbilaran City', 'Bohol Countryside Day Tour from Cebu City or Mactan', 'Popular', 'Luxury', 10),
('Boh-5', 'Tagbilaran City', 'Tagbilaran City Tour', 'Popular', 'Mid-range', 11),
('Boh-6', 'Panglao', 'Panglao Island', 'Popular', 'Mid-range', 12),
('Boh-7', 'Panglao', 'Oceanica Resort', 'Popular', 'Mid-range', 13),
('Boh-8', 'Panglao', 'Panglao Kartways', 'Popular', 'Mid-range', 14),
('Boh-9', 'Panglao', 'Panglao Golf Sports and Entertainment Parks', 'Popular', 'Luxury', 15);

-- --------------------------------------------------------

--
-- Table structure for table `boracayattractions`
--

CREATE TABLE `boracayattractions` (
  `AttractionID` char(6) NOT NULL,
  `Municipality` varchar(100) NOT NULL,
  `Attraction` varchar(255) NOT NULL,
  `PopularSecluded` varchar(50) NOT NULL,
  `Budget` varchar(50) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boracayattractions`
--

INSERT INTO `boracayattractions` (`AttractionID`, `Municipality`, `Attraction`, `PopularSecluded`, `Budget`, `id`) VALUES
('Bor-1', 'Malay', 'Hinugtan Beach (100)', 'Popular', 'Mid-range', 1),
('Bor-10', 'Boracay Island', 'Crystal Cove Island', 'Popular', 'Mid-range', 2),
('Bor-2', 'Malay', 'Pagatpat Mangrove Park (30)', 'Popular', 'Mid-range', 3),
('Bor-3', 'Malay', 'Hacienda Maria (20 - 50)', 'Popular', 'Mid-range', 4),
('Bor-4', 'Malay', 'Jawili Falls (20 - 50)', 'Popular', 'Mid-range', 5),
('Bor-5', 'Malay', 'Ariels Point', 'Popular', 'Mid-range', 6),
('Bor-6', 'Boracay Island', 'White Beach', 'Popular', 'Mid-range', 7),
('Bor-7', 'Boracay Island', 'Puka Beach', 'Popular', 'Mid-range', 8),
('Bor-8', 'Boracay Island', 'Mount luho Viewpoint', 'Popular', 'Mid-range', 9),
('Bor-9', 'Boracay Island', 'Willys Rock', 'Popular', 'Mid-range', 10);

-- --------------------------------------------------------

--
-- Table structure for table `cebuattractions`
--

CREATE TABLE `cebuattractions` (
  `AttractionID` char(6) NOT NULL,
  `Municipality` varchar(100) NOT NULL,
  `Attraction` varchar(255) NOT NULL,
  `PopularSecluded` varchar(50) NOT NULL,
  `Budget` varchar(50) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cebuattractions`
--

INSERT INTO `cebuattractions` (`AttractionID`, `Municipality`, `Attraction`, `PopularSecluded`, `Budget`, `id`) VALUES
('Ceb-1', 'Cebu City', 'Sirao Garden (100 pesos)', 'Popular', 'Budget', 1),
('Ceb-10', 'Mactan', 'San Vicente Marine Sanctuary (25 pesos)', 'Popular', 'Budget', 2),
('Ceb-11', 'Oslob', 'Tumalog Falls (50 pesos)', 'Popular', 'Budget', 3),
('Ceb-12', 'Oslob', 'Oslob Whale Shark Watching (1,000 pesos)', 'Popular', 'Luxury', 4),
('Ceb-13', 'Oslob', 'Sumilon Island (1,500 pesos)', 'Popular', 'Luxury', 5),
('Ceb-14', 'Oslob', 'Cuartel Ruins (Museo Oslob)', 'Popular', 'Budget', 6),
('Ceb-15', 'Oslob', 'Baluarte Ruins (75 pesos)', 'Popular', 'Budget', 7),
('Ceb-2', 'Cebu City', 'Cebu ocean park (800 pesos)', 'Popular', 'Luxury', 8),
('Ceb-3', 'Cebu City', 'Taoist temple', 'Popular', 'Budget', 9),
('Ceb-4', 'Cebu City', 'Temple of Leah (150 pesos)', 'Popular', 'Budget', 10),
('Ceb-5', 'Cebu City', 'Cebu Heritage', 'Popular', 'Budget', 11),
('Ceb-6', 'Mactan', 'Nalusuan Island Marine Sanctuary (200 pesos)', 'Popular', 'Mid-range', 12),
('Ceb-7', 'Mactan', 'Caohagan Island (200 pesos)', 'Popular', 'Mid-range', 13),
('Ceb-8', 'Mactan', 'Gilutongan Island (150 pesos)', 'Popular', 'Mid-range', 14),
('Ceb-9', 'Mactan', 'Olango Island (20 pesos)', 'Popular', 'Budget', 15);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `CityID` char(3) NOT NULL,
  `City` varchar(100) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`CityID`, `City`, `id`) VALUES
('Boh', 'Bohol', 1),
('Bor', 'Boracay', 2),
('Ceb', 'Cebu', 3),
('Dav', 'Davao', 4),
('Pal', 'Palawan', 5);

-- --------------------------------------------------------

--
-- Table structure for table `davaoattractions`
--

CREATE TABLE `davaoattractions` (
  `AttractionID` char(6) NOT NULL,
  `Municipality` varchar(100) NOT NULL,
  `Attraction` varchar(255) NOT NULL,
  `PopularSecluded` varchar(50) NOT NULL,
  `Budget` varchar(50) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `davaoattractions`
--

INSERT INTO `davaoattractions` (`AttractionID`, `Municipality`, `Attraction`, `PopularSecluded`, `Budget`, `id`) VALUES
('Dav-1', 'Davao City', 'Malagos Garden Resort', 'Popular', 'Mid-range', 1),
('Dav-10', 'Samal', 'Hagimit Falls', 'Popular', 'Free', 2),
('Dav-11', 'Tagum', 'Christ the King Cathedral', 'Popular', 'Free', 3),
('Dav-12', 'Tagum', 'Energy Park (E-Park)', 'Popular', 'Free', 4),
('Dav-13', 'Tagum', 'Banana Beach', 'Popular', 'Free', 5),
('Dav-14', 'Tagum', 'Tagum Night Market', 'Popular', 'Free', 6),
('Dav-15', 'Tagum', 'Tagum City River Cruise', 'Off the beaten path', 'Free', 7),
('Dav-2', 'Davao City', 'Japanese Tunnel', 'Popular', 'Free', 8),
('Dav-3', 'Davao City', 'Mount Apo', 'Off the beaten path', 'Free', 9),
('Dav-4', 'Davao City', 'D Bone Collector Museum', 'Popular', 'Mid-range', 10),
('Dav-5', 'Davao City', 'Eden Nature Park', 'Popular', 'Mid-range', 11),
('Dav-6', 'Samal', 'PEARL FARM BEACH RESORT', 'Popular', 'Luxury', 12),
('Dav-7', 'Samal', 'Maxima Aquafun', 'Off the beaten path', 'Free', 13),
('Dav-8', 'Samal', 'Canibad Secret Paradise Beach', 'Popular', 'Free', 14),
('Dav-9', 'Samal', 'Monfort Bat Cave Sanctuary', 'Off the beaten path', 'Free', 15);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(10) NOT NULL,
  `Flight_from` varchar(255) NOT NULL,
  `Flight_to` varchar(255) NOT NULL,
  `Date_Departure` date NOT NULL,
  `Date_Arrival` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `Flight_from`, `Flight_to`, `Date_Departure`, `Date_Arrival`) VALUES
(5, 'Manila', 'palawan', '2025-12-21', '2025-12-24'),
(6, 'Manila', 'cebu', '2025-12-21', '2025-12-24'),
(7, 'Manila', 'Boracay', '2024-12-21', '2024-12-21'),
(8, 'Manila', 'Bohol-Panglao', '2025-07-01', '2025-07-01'),
(9, 'Manila', 'Davao City', '2025-06-02', '2025-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `palawanattractions`
--

CREATE TABLE `palawanattractions` (
  `AttractionID` char(6) NOT NULL,
  `Municipality` varchar(100) NOT NULL,
  `Attraction` varchar(255) NOT NULL,
  `PopularSecluded` varchar(50) NOT NULL,
  `Budget` varchar(50) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `palawanattractions`
--

INSERT INTO `palawanattractions` (`AttractionID`, `Municipality`, `Attraction`, `PopularSecluded`, `Budget`, `id`) VALUES
('Pal-1', 'El nido', 'Secret Lagoon', 'Popular', 'Mid Range', 1),
('Pal-10', 'Coron', 'Siete Pecados Marine Park', 'Popular', 'Budget', 2),
('Pal-11', 'Puerto Princesa', 'Puerto Princesa Subterranean River National Parlk', 'Popular', 'Luxury', 3),
('Pal-12', 'Puerto Princesa', 'Explore Honda Bay Island', 'Popular', 'Budget', 4),
('Pal-13', 'Puerto Princesa', 'Bakers Hill', 'Popular', 'Budget', 5),
('Pal-14', 'Puerto Princesa', 'Palawan Wildlife conversation Center', 'Popular', 'Budget', 6),
('Pal-15', 'Puerto Princesa', 'Ugong Rock Adventures', 'Popular', 'Budget', 7),
('Pal-2', 'El nido', 'Hidden Beach', 'Popular', 'Budget', 8),
('Pal-3', 'El nido', 'Taraw Cliff', 'Popular', 'Luxury', 9),
('Pal-4', 'El nido', 'Zipline in Las Cabanas', 'Popular', 'Luxury', 10),
('Pal-5', 'El nido', 'Big Lagoon', 'Popular', 'Mid Range', 11),
('Pal-6', 'Coron', 'Twin Lagoon', 'Popular', 'Mid Range', 12),
('Pal-7', 'Coron', 'Baracuda Lake', 'Popular', 'Mid Range', 13),
('Pal-8', 'Coron', 'Mount Tapyas', 'Popular', 'Budget', 14),
('Pal-9', 'Coron', 'Pukaway Cave Underground Lake', 'Secluded', 'Luxury', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomodations`
--
ALTER TABLE `accomodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boholattractions`
--
ALTER TABLE `boholattractions`
  ADD PRIMARY KEY (`AttractionID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `boracayattractions`
--
ALTER TABLE `boracayattractions`
  ADD PRIMARY KEY (`AttractionID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cebuattractions`
--
ALTER TABLE `cebuattractions`
  ADD PRIMARY KEY (`AttractionID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`CityID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `davaoattractions`
--
ALTER TABLE `davaoattractions`
  ADD PRIMARY KEY (`AttractionID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `palawanattractions`
--
ALTER TABLE `palawanattractions`
  ADD PRIMARY KEY (`AttractionID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomodations`
--
ALTER TABLE `accomodations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `boholattractions`
--
ALTER TABLE `boholattractions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `boracayattractions`
--
ALTER TABLE `boracayattractions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cebuattractions`
--
ALTER TABLE `cebuattractions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `davaoattractions`
--
ALTER TABLE `davaoattractions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `palawanattractions`
--
ALTER TABLE `palawanattractions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
