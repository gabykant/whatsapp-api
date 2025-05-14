<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class AutomateWhatsApp extends Controller
{
    public function index(Request $request) {
        try {
            if($request->query("ctype") === "awaiting_category") {
                return response()->json([
                    'success' => true,
                    'data' => Category::all()
                ], 200);
            } elseif($request->query("ctype") === "awaiting_products") {
                return response()->json([
                    'success' => true,
                    'data' => Product::where("category_id", $request->query("cid"))->get()
                ], 200);
            } else  {
                return response()->json([
                    'success' => true,
                    'data' => array()
                ], 200);
            } 
        } catch(\Exception $e) {
            Log::info($e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Erreur serveur.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
